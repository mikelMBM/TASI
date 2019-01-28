var express = require('express');
var router = express.Router();
var session = require("express-session");
var parser = require("body-parser");
var cookieParser = require("cookie-parser");
var mysql = require("mysql");
var fs = require("fs");
var mailing = require("sendmail")();

//Initialisiere Datenbankverbindung
var connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "tasi",
    port: "3306"
});

router.get("/", (req, res) => {
    res.redirect("/index");
})

//ROUTE index
router.get("/index", (req, res) => {
    var meldungUP = "";
    if(req.session.loginfail == true) {
        meldungUP = "Username oder Passwort ist falsch. Bitte erneut versuchen!";
        req.session.loginfail = false;
    }
    res.render("index", {
        meldung: meldungUP
    });
});

//ROUTE logged
router.post("/logged", (req, res) => {
    //Übernehme Username und PW aus Formular
    var username = req.body.username;
    var password = req.body.password;

    var squery = "SELECT username FROM user";

    connection.query(squery, function (err, result, fields) {
        
        //Feststellen, ob Nutzer vorhanden
        var i = 0;
        var user = false;
        while(i<result.length) {
            if(username == result[i].username) {
                user = true;
                break;
            } else {
                i++;
            }
        }
        if(user == false) {
            req.session.loginfail = true;
            res.redirect("/index");
        } else {

            //Abfragen, ob PW richtig ist, Session starten
            var squery = "SELECT password, NutzerID, RollenID FROM user WHERE username = ?";

            connection.query(squery, username, function (err, result, fields) {
                if(err) throw err;
                var pw = result[0].password;
                if(pw == password) {
                    req.session.user = username;
                    req.session.usid = result[0].NutzerID;
                    req.session.roleid = result[0].RollenID;
                    req.session.loginfail = false;
                    res.redirect("/start");
                } else {
                    req.session.loginfail = true;
                    res.redirect("/index");
                }
            });
        }
    });
});

//ROUTE passwortvergessen
router.get("/passwortvergessen", (req, res) => {
    var meldung = "";
    if(req.session.wrongmail == 1) {
        meldung = "E-Mail-Adresse konnte nicht zugeordnet werden. Bitte überprüfen Sie die Eingabe!";
        req.session.wrongmail = 0;
    } else if (req.session.wrongmail == 2) {
        meldung = "Eine E-Mail mit Ihrem neuen Passwort wurde versendet. Bitte überprüfen Sie Ihre E-Mails.";
        req.session.wrongmail = 0;
    } else {
        meldung ="";
    }
    res.render("passwortvergessen", {
        meldung: meldung
    });
});

//ROUTE reset
router.post("/reset", (req, res) => {
    var mail = req.body.mail;

    var squery = "SELECT email FROM user";

    connection.query(squery, function (err, result, fields) {
        
        //Feststellen, ob Nutzer vorhanden
        var i = 0;
        var here = false;
        while(i<result.length) {
            if(mail == result[i].email) {
                here = true;
                break;
            } else {
                i++;
            }
        }
        if(here == false) {
            req.session.wrongmail = 1;
            res.redirect("/passwortvergessen");
        } else {
            req.session.wrongmail = 2;
            var newPW = "kardoffelsalad";
            // Setze PW zurück
            var squery = "UPDATE user SET password = ? WHERE email = ?";
            connection.query(squery, [newPW, mail], function(err, result) {

                // Versende Mail mit neuem PW
                mailing({
                    from: 'admin@tasi.com',
                    to: mail,
                    subject: 'TEST',
                    text: 'He du Schlafmütze. Dein Neues Passwort lautet: ' + newPW
                });
                res.redirect("/passwortvergessen");
            });
            
        }
    });
    
});

//ROUTE logout
router.get("/logout", (req, res) => {
    delete req.session;
    res.redirect("/index");
});

//ROUTE start
router.get("/start", (req, res) => {
    var username = req.session.user;
    var usid = req.session.usid;

    var squery = "SELECT * " + 
                 "FROM user " + 
                 "WHERE NutzerID = ?";
    
    //Parameter nur aus 'user' holen
    connection.query(squery, usid, function (err, result, fields) {
        if(err) throw err;

        var vorname = result[0].vorname;
        var nachname = result[0].nachname;
        var adresse = result[0].adresse + ";  " + result[0].stadt;
        var mail = result[0].email;
        var telefon = result[0].tel;
        var bild;
        var mannschaft = "";
        var geburtstag = result[0].geburtsdatum;
        var position = result[0].position;

        if(result[0].bild == "") {
            bild = "profilbilder/fotoDummy.jpg";
        } else {
            bild = result[0].bild;
        }

        var rollenID = result[0].RollenID;
        var nutzerID = result[0].NutzerID;

        var squery = "SELECT Bezeichnung " + 
                     "FROM rolle WHERE RollenID = ?";

        //Parameter Status abfragen
        connection.query(squery, rollenID, function(err, result, fields) {
            var status = result[0].Bezeichnung;

            if(status == "Trainer") {
                var squery = "SELECT Bezeichnung " + 
                             "FROM Mannschaften " + 
                             "WHERE SpielerID = ?";

                var squery2 =   "SELECT * " +
                                "FROM training " +
                                "WHERE TrainerID = ?";

            } else if(status == "Spieler") {
                var squery = "SELECT mannschaften.Bezeichnung " + 
                             "FROM user, mannschaften, mannschaftszuweisung " + 
                             "WHERE user.NutzerID = mannschaftszuweisung.SpielerID " + 
                             "AND mannschaftszuweisung.MannschaftsID = mannschaften.MannschaftsID " + 
                             "AND user.NutzerID = ?";

                var squery2 =   "SELECT * " +
                                "FROM training, trainingszuweisung " +
                                "WHERE training.TrainingsID = trainingszuweisung.TrainingsID " +
                                "AND trainingszuweisung.SpielerID = ?";
            }

            //Parameter Mannschaft abfragen
            connection.query(squery, nutzerID, function(err, result, fields) {

                if(result.length == 1) {
                    mannschaft = result[0].Bezeichnung;
                } else if (result.length == 0) {
                    mannschaft = "Aktuell nicht aktiv";
                } else {
                    var i = 0;
                    while(i<result.length) {
                        mannschaft += result[i].Bezeichnung + ", ";
                        i++;
                    }
                }
                connection.query(squery2, req.session.usid, function(err, result, fields) {
                    var plans = [];
                    for(entry of result) {
                        plans.push(entry);
                    }

                    res.render("profil", {
                        username: username,
                        vorname: vorname,
                        nachname: nachname,
                        status: status,
                        mannschaft: mannschaft,
                        adresse: adresse,
                        mail: mail,
                        telefon: telefon,
                        bild: bild,
                        position: position,
                        geburtstag: geburtstag,
                        plan: plans,
                        roleid: req.session.roleid
                    });
                });
            });
        });
    });    
});





module.exports = router;