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

//ROUTE nutzerverwaltung
router.get("/nutzerverwaltung", (req, res) => {
    var squery = "SELECT * FROM user WHERE RollenID = 2";
    var users = [];
    connection.query(squery, function (err, result) {
        for(entry of result) {
            users.push(entry);
        }
        res.render("nutzerverwaltung", {
            users: users,
            roleid: req.session.roleid
        });
    });
});

//ROUTE showuser
router.post("/showuser", (req, res) => {
    var usid = req.body.usid;

    var user = new Array();
    user[0] = new Object();

    var squery = "SELECT * " + 
                 "FROM user " + 
                 "WHERE NutzerID = ?";
    
    //Parameter nur aus 'user' holen
    connection.query(squery, usid, function (err, result, fields) {
        if(err) throw err;

        user[0]["vorname"] = result[0].vorname;
        user[0]["nachname"] = result[0].nachname;
        user[0]["adresse"] = result[0].adresse + ";  " + result[0].stadt;
        user[0]["mail"] = result[0].email;
        user[0]["telefon"] = result[0].tel;
        user[0]["bild"];
        user[0]["mannschaft"] = "";
        user[0]["geburtstag"] = result[0].geburtsdatum;
        user[0]["position"] = result[0].position;
        user[0]["nutzerID"] = result[0].NutzerID;
        user[0]["username"] = result[0].username;
        user[0]["strasse"] = result[0].adresse;
        user[0]["stadt"] = result[0].stadt;

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
            user[0]["status"] = result[0].Bezeichnung;

            if(user[0]["status"] == "Trainer") {
                var squery = "SELECT Bezeichnung " + 
                             "FROM Mannschaften " + 
                             "WHERE SpielerID = ?";


            } else if(user[0]["status"] == "Spieler") {
                var squery = "SELECT mannschaften.Bezeichnung, mannschaften.MannschaftsID " + 
                             "FROM user, mannschaften, mannschaftszuweisung " + 
                             "WHERE user.NutzerID = mannschaftszuweisung.SpielerID " + 
                             "AND mannschaftszuweisung.MannschaftsID = mannschaften.MannschaftsID " + 
                             "AND user.NutzerID = ?";

            }

            //Parameter Mannschaft abfragen
            connection.query(squery, nutzerID, function(err, result, fields) {
                if(result.length == 1) {
                    user[0]["mannschaft"] = result[0].Bezeichnung;
                } else if (result.length == 0) {
                    user[0]["mannschaft"] = "Aktuell nicht aktiv";
                } else {
                    var i = 0;
                    while(i<result.length) {
                        user[0]["mannschaft"] += result[i].Bezeichnung + ", ";
                        i++;
                    }
                }
                res.send(user[0]);
            });
        });
    });
});

//ROUTE nutzerverwaltung/user
router.get("/nutzerverwaltung/user/:id", (req, res) => {
    var squery = "SELECT * FROM user WHERE RollenID = 2";
    var users = [];
    var mannschaften = [];
    var neworchange = req.params.id;
    connection.query(squery, function (err, result) {
        for(entry of result) {
            users.push(entry);
        }

        squery = "SELECT Bezeichnung, MannschaftsID FROM mannschaften WHERE SpielerID = ?";

        connection.query(squery, req.session.usid, function(err, result) {
            for(entry of result) {
                mannschaften.push(entry);
            }
            res.render("neueruser", {
                users: users,
                mannschaften: mannschaften,
                neworchange: neworchange,
                roleid: req.session.roleid
            });
        });
        
    });
});

//ROUTE saveuser
router.post("/saveuser", (req, res) => {
    var squery = "INSERT INTO user (vorname, nachname, email, username, password, RollenID, adresse, stadt, position, geburtsdatum) VALUES ?";//(" + req.body.vorname + ", " + req.body.nachname + ", " + req.body.mail + ", " + req.body.username + ", ANFANGSPW, " + req.body.status +", " + req.body.strasse + ", " + req.body.stadt + ")";

    var values = [[req.body.vorname, req.body.nachname, req.body.mail, req.body.username, "ANFANGSPW", req.body.status, req.body.strasse, req.body.stadt, req.body.position, req.body.geburtstag]];
    console.log(squery);
    connection.query(squery, [values], function(err, result) {
        var lastid = result.insertId;

        squery = "INSERT INTO mannschaftszuweisung (MannschaftsID, SpielerID) VALUES ?";
        for(entry of req.body.mannschaft) {
            values = [[entry, lastid]];
            connection.query(squery, [values], function(err, result) {
            		
            });
        };
        res.send(true);
    })
});

//ROUTE mannschaften
router.post("/mannschaften", (req, res) => {
    var mannschaften = [];
    squery = "SELECT Bezeichnung, MannschaftsID FROM mannschaften WHERE SpielerID = ?";

    connection.query(squery, req.session.usid, function(err, result) {
        for(entry of result) {
            mannschaften.push(entry);
        }
        res.send(mannschaften);
    });
});

//ROUTE useredit
router.post("/useredit", (req, res) => {
    var squery = "SELECT NutzerID FROM user WHERE vorname='" + req.body.vorname + "' AND nachname='" + req.body.nachname + "' AND email='" + req.body.mail + "'";
    console.log(req.body);
    connection.query(squery, function(err, result) {
        var userid = result[0].NutzerID;    
        squery =    "UPDATE user SET vorname='" + req.body.vorname + "', nachname='" + req.body.nachname + "', email='" + req.body.mail + "', username='" + req.body.username + 
                    "', RollenID='" + req.body.status + "', adresse='" + req.body.strasse + "', stadt='" + req.body.stadt + "', position='" + req.body.position + "', geburtsdatum='" + req.body.geburtstag +
                    "' WHERE NutzerID=" + userid;
        connection.query(squery, function(err, result){
            squery = "DELETE FROM mannschaftszuweisung WHERE SpielerID=" + userid;
            connection.query(squery, function(err, result){
                squery = "INSERT INTO mannschaftszuweisung (MannschaftsID, SpielerID) VALUES ?";

                for(entry of req.body.mannschaft) {
                    values = [[entry, userid]];
                    connection.query(squery, [values], function(err, result) {

                    });
                };
            });
        });
        res.send(true);
    });
});

//ROUTE deleteuser
router.post("/deleteuser", (req, res) => {
    var squery = "DELETE FROM user WHERE NutzerID = " + req.body.userid;
    connection.query(squery, function(err, result) {
        squery = "DELETE FROM mannschaftszuweisung WHERE SpielerID = " + req.body.userid;
        connection.query(squery, function(err, result) {
            squery = "DELETE FROM trainingszuweisung WHERE SpielerID = " + req.body.userid;
            connection.query(squery, function(err, result) {

            });
        });
        res.send(true);
    });
});

module.exports = router;