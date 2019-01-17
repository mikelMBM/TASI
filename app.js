

//Created 23.1.18 by Stephan Burkowski
// yeah mega github style
//1. Packages einbinden
var express = require("express");
var session = require("express-session");
var parser = require("body-parser");
var cookieParser = require("cookie-parser");
var mysql = require("mysql");
var fs = require("fs");
var mailing = require("sendmail")();

//2. Initialisiere Datenbankverbindung
var connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "tasi",
    port: "3306"
});



//3. Starte Server
var app = express();

//3.1. Stellt ein, wo die Views zu finden sind
app.set("view engine", "ejs");
app.set("views", "./views");

//3.2. Sage, dass die Packages benutzt werden sollen
app.use(parser.urlencoded({extended: true}));
app.use(express.static("./public"));
app.use(express.static("./views"));
app.use(cookieParser());
app.use(session({secret: "secret", resave: false, saveUninitialized: true}));

//4. Seitenansichten

app.get("/", (req, res) => {
    res.redirect("/index");
})

//Index/Loginseite aufrufen
app.get("/index", (req, res) => {
    var meldungUP = "";
    if(req.session.loginfail == true) {
        meldungUP = "Username oder Passwort ist falsch. Bitte erneut versuchen!";
        req.session.loginfail = false;
    }
    res.render("index", {
        meldung: meldungUP
    });
});

//Loginalgorithmus, Session erstellen
app.post("/logged", (req, res) => {
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

//Seite Neues Passwort
app.get("/passwortvergessen", (req, res) => {
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

//Backend Neues Passwort
app.post("/reset", (req, res) => {
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

//Session beenden, auf Loginseite verweisen
app.get("/logout", (req, res) => {
    delete req.session;
    res.redirect("/index");
})

//Startseite aufrufen, Parameter einbinden
app.get("/start", (req, res) => {

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

app.get("/uebungssammlung", (req, res) => {
    var roleid = req.session.roleid;
    var uebungen = [];
    var favourite;
    var squery =    "SELECT uebungen.UebungsID, uebungen.Video, uebungen.Bezeichnung " +
                    "FROM uebungen";
                    
    connection.query(squery, function(err, result, fields){
        var i = 0;
        var length = result.length;
        for(entry of result) {
            uebungen.push(entry);
         
        
            squery =    "SELECT * " +
                        "FROM uebungsfavorisierung " +
                        "WHERE UebungsID = ? " +
                        "AND TrainerID = ?";

            connection.query(squery, [entry.UebungsID, req.session.usid], function(err, result, fields) {
                if(result.length == 0) {
                    uebungen[i]["favourite"] = false;
                } else {
                    uebungen[i]["favourite"] = true;
                }
                i++;
                if(i == length){
                    res.render("uebungssammlung", {
                        uebungen: uebungen,
                        roleid: roleid
                    });
                }
            });

        }

    });
    
});

//Uebungen handlen
app.get("/uebungssammlung/uebung/:id", (req, res) => {
    var ueb = req.params.id;
    var squery =    "SELECT Bezeichnung, Kategorie, Unterkategorie, Niveau, Dauer, Beschreibung, Video " +
                    "FROM uebungen " +
                    "WHERE UebungsID = ?";
    
    connection.query(squery, ueb, function(err, result, fields) {
        if(err) throw err;

        var uebungsname = result[0].Bezeichnung;
        var uebungskat = result[0].Kategorie;
        var uebungssubkat = result[0].Unterkategorie;
        var niveau = result[0].Niveau;
        var dauer = result[0].Dauer;
        var beschreibung = result[0].Beschreibung;
        var video = result[0].Video;
        var hilfsmittel = "";
        var favourite = false;
        var plan = [];

        squery =    "SELECT hilfsmittel.Bezeichnung " +
                    "FROM hilfsmittel, hilfsmittelzuweisung " +
                    "WHERE hilfsmittel.HilfsmittelID = hilfsmittelzuweisung.HilfsmittelID " +
                    "AND hilfsmittelzuweisung.uebungsID = ?";

        connection.query(squery, ueb, function(err, result, fields) {

            if(result.length == 1) {
                hilfsmittel = result[0].Bezeichnung;
            } else if (result.length == 0) {
                hilfsmittel = "ohne Hilfsmittel";
            } else {
                var i = 0;
                while(i<result.length) {
                    hilfsmittel += result[i].Bezeichnung + "; ";
                    i++;
                }
            }
            
            squery =    "SELECT * " +
                        "FROM uebungsfavorisierung " +
                        "WHERE UebungsID = ? " +
                        "AND TrainerID = ?";

            connection.query(squery, [ueb, req.session.usid], function(err, result, fields) {

                if(result.length == 0) {
                    favourite = false;
                } else {
                    favourite = true;
                }

                squery =    "SELECT Bezeichnung, TrainingsID " +
                            "FROM training " +
                            "WHERE TrainerID = ?";

                connection.query(squery, req.session.usid, function(err, result, fields) {
                    for(entry of result) {
                        plan.push(entry);
                    }

                    res.render("uebungseinheit", {
                        uebungsname: uebungsname,
                        uebungskat: uebungskat,
                        uebungssubkat: uebungssubkat,
                        niveau: niveau,
                        hilfsmittel: hilfsmittel,
                        dauer: dauer,
                        beschreibung: beschreibung,
                        video: video,
                        favourite: favourite,
                        uebid: ueb,
                        plan: plan,
                        roleid: req.session.roleid
                    });
                }); 
            });
        });
    });
});

app.post("/favo", (req, res) => {
    if(req.body.favorized == "true") {
        var squery = "DELETE FROM uebungsfavorisierung WHERE TrainerID = " + req.session.usid + " AND UebungsID = " + req.body.uebung;
    } else {
        var squery = "INSERT INTO uebungsfavorisierung (TrainerID, UebungsID) VALUES (" + req.session.usid + ", " + req.body.uebung + ")";
        var values = [[req.session.usid, req.body.uebung]];
    }
    if(req.body.page == 2) {
        var redirect = "/uebungssammlung";
    } else if(req.body.page == 1) {
        var redirect = "/uebungssammlung/uebung/" + req.body.uebung;
    }
    connection.query(squery, function(err, result) {
        res.redirect(redirect);
    });
});

app.post("/adduebung", (req, res) => {
    var squery = "INSERT INTO uebungszuweisung (UebungsID, TrainingsID) VALUES (" + req.body.uebung + ", " + req.body.plan + ")";
    connection.query(squery, function(err, result) {
        res.redirect("/uebungssammlung/uebung/" + req.body.uebung);
    });
});

//Trainings handlen
app.get("/trainingsplaene", (req, res) => {
    if(req.session.roleid == 1) {
        squery = "SELECT TrainingsID FROM trainingsplaene WHERE TrainerID = ?";
        connection.query(squery, req.session.usid, function(err, result) {

            var id = result[0].TrainingsID;
            var url = "/trainingsplaene/" + id;
            res.redirect(url);
        });
    }else if(req.session.roleid == 2) {
        squery =    "SELECT trainingsplane.TrainingsID, training.Bezeichnung FROM training, trainingszuweisung " +
                    "WHERE trainingsplaene.TrainingsID = trainingszuweisung.TrainingsID AND SpielerID = ?";

        connection.query(squery, req.session.usid, function(err, result) {

            var id = result[0].TrainingsID;
            var url = "/trainingsplaene/" + id;
            res.redirect(url);
        });
    }
});

app.get("/training/:id", (req, res) => {
    var train = req.params.id;
    var allplans = [];

    var squery =    "SELECT training.Bezeichnung " +
                    "FROM training " +
                    "WHERE TrainingsID = ?";
    
    connection.query(squery, train, function(err, result, fields) {
        var trainingsbezeichnung = result[0].Bezeichnung;
        var uebung = [];

        squery =    "SELECT uebungen.UebungsID, uebungen.Bezeichnung, uebungen.Kategorie, uebungen.Unterkategorie, uebungen.Dauer, uebungen.Niveau, uebungen.Video, uebungen.Beschreibung " +
                    "FROM uebungen, uebungszuweisung " +
                    "WHERE uebungen.UebungsID = uebungszuweisung.UebungsID " +
                    "AND uebungszuweisung.TrainingsID = ?";
        
        connection.query(squery, train, function(err, result, fields) {
            var e = 0;
            var length = result.length;
            for(entry of result) {
                uebung.push(entry);

                squery =    "SELECT hilfsmittel.Bezeichnung " +
                            "FROM hilfsmittel, hilfsmittelzuweisung " +
                            "WHERE hilfsmittel.HilfsmittelID = hilfsmittelzuweisung.HilfsmittelID " +
                            "AND hilfsmittelzuweisung.uebungsID = ?";

                connection.query(squery, entry.UebungsID, function(err, result, fields) {
                    uebung[e]["Hilfsmittel"]="";
                    if(result.length == 1) {
                        uebung[e]["Hilfsmittel"] = result[0].Bezeichnung;
                    } else if (result.length == 0) {
                        uebung[e]["Hilfsmittel"] = "ohne Hilfsmittel";
                    } else {
                        var i = 0;
                        while(i<result.length) {
                            uebung[e]["Hilfsmittel"] += result[i].Bezeichnung + "; ";
                            i++;
                        }
                    }
                    e++;
                    if(e == length) {
                        if(req.session.roleid == 1) {
                            squery = "SELECT TrainingsID, Bezeichnung FROM training WHERE TrainerID = ?";
                            connection.query(squery, req.session.usid, function(err, result) {
                                for(entry of result) {
                                    allplans.push(entry);
                                }
                                res.render("training", {
                                    trainingsbezeichnung: trainingsbezeichnung,
                                    uebung: uebung ,
                                    allplans: allplans,
                                    roleid: req.session.roleid
                                });
                            });
                        }

                        } else if(req.session.roleid == 2) {
                            squery =    "SELECT training.TrainingsID, training.Bezeichnung FROM training, trainingszuweisung " +
                                        "WHERE training.TrainingsID = trainingszuweisung.TrainingsID AND SpielerID = ?";

                            connection.query(squery, req.session.usid, function(err, result) {
                                for(entry of result) {
                                    allplans.push(entry);
                                }
                                res.render("training", {
                                    trainingsbezeichnung: trainingsbezeichnung,
                                    uebung: uebung,
                                    allplans: allplans,
                                    roleid: req.session.roleid
                                });
                            });
                        }
                    }

                );
            
            }
            
        });
    });
    
});

app.get("/uebunganzeigen/:id/:training", (req,res) => {
    var ueb = req.params.id;
    var training = req.params.training;
    var squery =    "SELECT Bezeichnung, Kategorie, Unterkategorie, Niveau, Dauer, Beschreibung, Video " +
                    "FROM uebungen " +
                    "WHERE UebungsID = ?";
    
    connection.query(squery, ueb, function(err, result, fields) {
        if(err) throw err;

        var uebungsname = result[0].Bezeichnung;
        var uebungskat = result[0].Kategorie;
        var uebungssubkat = result[0].Unterkategorie;
        var niveau = result[0].Niveau;
        var dauer = result[0].Dauer;
        var beschreibung = result[0].Beschreibung;
        var video = result[0].Video;
        var hilfsmittel = "";
        var favourite = false;
        var plan = [];

        squery =    "SELECT hilfsmittel.Bezeichnung " +
                    "FROM hilfsmittel, hilfsmittelzuweisung " +
                    "WHERE hilfsmittel.HilfsmittelID = hilfsmittelzuweisung.HilfsmittelID " +
                    "AND hilfsmittelzuweisung.uebungsID = ?";

        connection.query(squery, ueb, function(err, result, fields) {
            if(result.length == 1) {
                hilfsmittel = result[0].Bezeichnung;
            } else if (result.length == 0) {
                hilfsmittel = "ohne Hilfsmittel";
            } else {
                var i = 0;
                while(i<result.length) {
                    hilfsmittel += result[i].Bezeichnung + "; ";
                    i++;
                }
            }

            res.write('<div class="grid_6" id="uebungsbezeichnung"><h4>' + uebungsname + '</h4></div>');
            res.write('<div class="grid_6"><h4>' + training + '</h4></div>');
            res.write('<div class="grid_6"><iframe src="' + video + '" width="460" height="260" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen=""></iframe>');
            res.write('<div id="bereich"><p>Kategorie: ' + uebungskat + ' | Unterkategorie: ' + uebungssubkat + ' | Niveau: ' + niveau + ' | Hilfsmittel: ' + hilfsmittel + ' | Dauer: ' + dauer + '</p></div>');
            res.write(beschreibung + ' <br><br>');
            res.end();
        });
    });
});

app.post("/saveplan", (req,res) => {

    var mannschaft = req.body.mannschaft;
    var uebungen = req.body.uebungen;
    var spieler = req.body.spieler;
    var bezeichnung = req.body.bezeichnung;
    var beschreibung = req.body.beschreibung;
    var uebungenid = [];
    var usid = req.session.user;

    if(mannschaft != "Mannschaft") {
        var squery = "INSERT INTO trainingsplaene (TrainerID, MannschaftsID, Bezeichnung, beschreibung) VALUES ?";
        var values = [[usid, mannschaft, bezeichnung, beschreibung]];
        connection.query(squery, [values], function(err, result) {
            var lastid = result.insertId;

            for(entry of uebungen) {

                squery = "INSERT INTO uebungszuweisung (UebungsID, TrainingsID) VALUES ?";
                values = [[entry, lastid]];
                connection.query(squery, [values], function(err, result) {
                    
                });

            }
            res.send(true);
        });
    } else if(spieler != "Spieler") {
        var squery = "INSERT INTO training (TrainerID) VALUES ?";
        var values = [[usid]];

        connection.query(squery, [values], function(err, result){
            var lastid = result.insertId;
            
            squery = "INSERT INTO trainingszuweisung (TrainingsID, SpielerID) VALUES ?";
            values = [[lastid, spieler]];

            connection.query(squery, [values], function(err, result) {
                for(entry of uebungen) {

                    squery = "INSERT INTO uebungszuweisung (UebungsID, TrainingsID) VALUES ?";
                    values = [[entry, lastid]];
                    connection.query(squery, [values], function(err, result) {
                        
                    });
    
                }
                res.redirect("/createplan");
            });
        });        
    }
    
});

app.post("/changeplan", (req,res) => {
    var trainingsID = req.body.trainingsid;
    var mannschaft = req.body.mannschaft;
    var uebungen = req.body.uebungen;
    var spieler = req.body.spieler;
    var bezeichnung = req.body.bezeichnung;
    var beschreibung = req.body.beschreibung;
    var uebungenid = [];
    var usid = req.session.user;
    console.log("IM SERVER - CHANGEPLAN");
    console.log(trainingsID);

    if(mannschaft != "Mannschaft") {
        var squery = "UPDATE training SET Bezeichnung = '" + bezeichnung + "', beschreibung = '" + beschreibung + "', MannschaftsID = '" + mannschaft + "' WHERE TrainingsID = " + trainingsID;
        connection.query(squery, function(err, result) {

            squery = "DELETE FROM uebungszuweisung WHERE TrainingsID = " + trainingsID;
            connection.query(squery, function(err, result) {
                for(entry of uebungen) {
                    squery = "INSERT INTO uebungszuweisung (UebungsID, TrainingsID) VALUES ?";
                    values = [[entry, trainingsID]];
                    console.log(entry);
                    connection.query(squery, [values], function(err, result) {

                    });
                }
            });

        });
    }else if(spieler != "Spieler") {
        var squery = "UPDATE training SET Bezeichnung = '" + bezeichnung + "', beschreibung = '" + beschreibung + "' WHERE TrainingsID = " + trainingsID;

        connection.query(squery, function(err, result){
            
            squery = "UPDATE trainingszuweisung SET SpielerID = '" + spieler + "' WHERE TrainingsID = " + trainingsID;

            connection.query(squery, function(err, result) {
                squery = "DELETE FROM uebungszuweisung WHERE TrainingsID = " + trainingsID;

                connection.query(squery, function(err, result) {

                    for(entry of uebungen) {
                        squery = "INSERT INTO uebungszuweisung (UebungsID, TrainingsID) VALUES ?";
                        values = [[entry, trainingsID]];
                        connection.query(squery, [values], function(err, result) {

                        });
                    }
                });
            });
            
            
        });        
    }
});

app.post("/filter", (req, res) => {
    var kategorie = req.body.kategorie;
    var subkategorie = req.body.subkategorie;
    var niveau = req.body.niveau;
    var dauer = req.body.dauer;

    var uebungen =[];


    var querykat = "";
    var querysubkat = "";
    var queryniveau = "";
    var querydauer = "";

    var squery =    "SELECT UebungsID, Video, Bezeichnung " +
                    "FROM uebungen WHERE ";

    if(kategorie != undefined) {
        var i=0;
        for(entry of kategorie) {

            if(i==0) {
                querykat += "Kategorie = '" + entry + "' ";
            } else {
                querykat += "OR Kategorie = '" + entry + "' ";
            }
            i++;
        }
    }
    if(subkategorie != undefined) {
        var i=0;
        for(entry of subkategorie) {

            if(i==0) {
                querysubkat += "Unterkategorie = '" + entry + "' ";
            } else {
                querysubkat += "OR Unterkategorie = '" + entry + "' ";
            }
            i++;
        }

    }
    if(niveau != undefined) {
        var i=0;
        for(entry of niveau) {

            if(i==0) {
                queryniveau += "Niveau = '" + entry + "' ";
            } else {
                queryniveau += "OR Niveau = '" + entry + "' ";
            }
            i++;
        }
    } 
    if(dauer != undefined) {
        var i=0;
        for(entry of dauer) {

            if(i==0) {
                querydauer += "Dauer = '" + entry + "' ";
            } else {
                querydauer += "OR Dauer = '" + entry + "' ";
            }
            i++;
        }
    }

    squery += querykat + " ";
    if(querysubkat != "" && querykat != "") {
        squery += "AND " + querysubkat + " ";
    }else if(querysubkat != "") {
        squery += querysubkat + " ";
    }
    if((queryniveau != "" && querykat != "") || (queryniveau != "" && querysubkat != "")){
        squery += "AND " + queryniveau + " ";
    }else if(queryniveau != "") {
        squery += queryniveau + " ";
    }
    if((querydauer != "" && querykat != "") || (querydauer != "" && querysubkat != "") || (querydauer != "" && queryniveau != "")) {
        squery += "AND " + querydauer + " ";
    }else if(querydauer != "") {
        squery += querydauer;
    }
    squery = squery.trim();

    connection.query(squery, function(err, result, fields) {
        var i = 0;
        var length = result.length;
        for(entry of result) {
            uebungen.push(entry);
        
            squery2 =   "SELECT * " +
                        "FROM uebungsfavorisierung " +
                        "WHERE UebungsID = ? " +
                        "AND TrainerID = ?";

            connection.query(squery2, [entry.UebungsID, req.session.usid], function(err, result, fields) {
                if(result.length == 0) {
                    uebungen[i]["favourite"] = false;
                } else {
                    uebungen[i]["favourite"] = true;
                }
                i++;
                if(i == length){
                    res.send(uebungen);
                }
            });
        }
    });
});

app.post("/filter3", (req, res) => {
    
    
    var kategorie = req.body.kategorie;
    var subkategorie = req.body.subkategorie;
    var niveau = req.body.niveau;
    var dauer = req.body.dauer;
    var favo = req.body.favo;

    var uebungen =[];
    
    if(kategorie != undefined || subkategorie != undefined || niveau != undefined || dauer != undefined) {

        var querykat = "";
        var querysubkat = "";
        var queryniveau = "";
        var querydauer = "";
        var squery = "";

        
        squery =    "SELECT UebungsID, Video, Bezeichnung " +
                    "FROM uebungen WHERE ";

        if(kategorie != undefined) {
            var i=0;
            for(entry of kategorie) {

                if(i==0) {
                    querykat += "Kategorie = '" + entry + "' ";
                } else {
                    querykat += "OR Kategorie = '" + entry + "' ";
                }
                i++;
            }
        }
        if(subkategorie != undefined) {
            var i=0;
            for(entry of subkategorie) {

                if(i==0) {
                    querysubkat += "Unterkategorie = '" + entry + "' ";
                } else {
                    querysubkat += "OR Unterkategorie = '" + entry + "' ";
                }
                i++;
            }

        }
        if(niveau != undefined) {
            var i=0;
            for(entry of niveau) {

                if(i==0) {
                    queryniveau += "Niveau = '" + entry + "' ";
                } else {
                    queryniveau += "OR Niveau = '" + entry + "' ";
                }
                i++;
            }
        } 
        if(dauer != undefined) {
            var i=0;
            for(entry of dauer) {

                if(i==0) {
                    querydauer += "Dauer = '" + entry + "' ";
                } else {
                    querydauer += "OR Dauer = '" + entry + "' ";
                }
                i++;
            }
        }

        squery += querykat + " ";
        if(querysubkat != "" && querykat != "") {
            squery += "AND " + querysubkat + " ";
        }else if(querysubkat != "") {
            squery += querysubkat + " ";
        }
        if((queryniveau != "" && querykat != "") || (queryniveau != "" && querysubkat != "")){
            squery += "AND " + queryniveau + " ";
        }else if(queryniveau != "") {
            squery += queryniveau + " ";
        }
        if((querydauer != "" && querykat != "") || (querydauer != "" && querysubkat != "") || (querydauer != "" && queryniveau != "")) {
            squery += "AND " + querydauer + " ";
        }else if(querydauer != "") {
            squery += querydauer;
        }
        squery = squery.trim();
    } else {
        squery = "SELECT UebungsID, Video, Bezeichnung FROM uebungen";
    }

    connection.query(squery, function(err, result, fields) {
        var i = 0;
        var length = result.length;
        
        for(entry of result) {
            uebungen.push(entry);
        
            squery2 =   "SELECT * " +
                        "FROM uebungsfavorisierung " +
                        "WHERE UebungsID = ? " +
                        "AND TrainerID = ?";

            connection.query(squery2, [entry.UebungsID, req.session.usid], function(err, result, fields) {
                if(result.length == 0) {
                    uebungen[i]["favourite"] = false;
                } else {
                    uebungen[i]["favourite"] = true;
                }
                i++;
                if(i == length) {
                    res.send([uebungen, req.body.favo]);
                }    
                
            });
        }
    });
});

app.post("/calluebungen", (req,res) => {
    var squery = "SELECT MannschaftsID, Beschreibung, Bezeichnung FROM training WHERE TrainingsID = ?";
    var daten = new Array();
    daten[0] = new Object();

    connection.query(squery, req.body.plan, function(err, result, fields) {
        daten[0]["MannschaftsID"]=result[0].MannschaftsID;
        daten[0]["Beschreibung"]=result[0].Beschreibung;
        daten[0]["Bezeichnung"]=result[0].Bezeichnung;
        daten[0]["Uebung"]=[];
        squery = "SELECT SpielerID FROM trainingszuweisung WHERE TrainingsID = ?"; 
        connection.query(squery, req.body.plan, function(err, result, fields) {
            console.log(result.length);
            if(result.length > 0) {
                daten[0]["SpielerID"]=result[0].SpielerID;
            }
            squery =    "SELECT uebungen.UebungsID, uebungen.Bezeichnung FROM uebungen, uebungszuweisung " + 
                        "WHERE uebungen.UebungsID = uebungszuweisung.UebungsID " +
                        "AND uebungszuweisung.TrainingsID = ?";

            connection.query(squery, req.body.plan, function(err, result, fields) {
                for(entry of result) {
                    daten[0]["Uebung"].push(entry);
                }
                res.send(daten);
            });
        });
    });
});

app.get("/createtrainingplan", (req, res) => {
    var uebungen = [];
    var mannschaft = [];
    var spieler = [];
    var plans = [];
    var e = 0;
    var f = 0;
    squery = "SELECT UebungsID, Bezeichnung FROM uebungen";

    connection.query(squery, function(err, result) {
        for(entry of result) {
            uebungen.push(entry);
        }
        squery =    "SELECT mannschaften.Bezeichnung, mannschaften.MannschaftsID " +
                    "FROM mannschaften " +
                    "WHERE mannschaften.SpielerID = ?";
        
        connection.query(squery, req.session.usid, function(err, result, fields) {
            var length = result.length;
            for(entry of result) {
                mannschaft.push(entry);

                squery =    "SELECT user.NutzerID, user.vorname, user.nachname " +
                            "FROM user, mannschaften, mannschaftszuweisung " +
                            "WHERE user.NutzerID = mannschaftszuweisung.SpielerID " +
                            "AND mannschaftszuweisung.MannschaftsID = ?"; 
                
                connection.query(squery, entry.MannschaftsID, function(err, result, fields) {
                    for(entry of result) {
                        spieler.push(entry);     
                    }
                    e++;
                    if(e == length) {
                      
                        spieler = removeDuplicates(spieler, "NutzerID");

                        squery = "SELECT TrainingsID, Bezeichnung, Beschreibung, MannschaftsID FROM training WHERE TrainerID = ?";
                        connection.query(squery, req.session.usid, function(err, result, fields) {
                            var length2 = result.length;
                            
                            for(entry of result) {
                                plans.push(entry);
                                squery =    "SELECT trainingszuweisung.SpielerID, user.vorname, user.nachname FROM trainingszuweisung, user, training " + 
                                            "WHERE trainingszuweisung.SpielerID = user.NutzerID AND trainingszuweisung.TrainingsID = ?";

                                connection.query(squery, entry.TrainingsID, function(err, result, fields) {
                                    for(entry of result) {
                                        //plans[f]["Spielername"] = entry.vorname + entry.nachname;
                                        plans[f]["SpielerID"] = entry.SpielerID;
                                    }
                                    f++
                                    if(f == length2) {
                                        res.render("createtrainingplan", {
                                            uebungen: uebungen,
                                            mannschaft: mannschaft,
                                            spieler: spieler,
                                            plans: plans,
                                            roleid: req.session.roleid
                                        });
                                    }
                                })
                            }
                            
                        });
                        
                    }
                });
            }
        });
    });
});

app.get("/nutzerverwaltung", (req, res) => {
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

app.post("/showuser", (req, res) => {
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

app.get("/nutzerverwaltung/user/:id", (req, res) => {
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

app.post("/saveuser", (req, res) => {

    var squery = "INSERT INTO user (vorname, nachname, email, username, password, RollenID, adresse, stadt, position, geburtsdatum) VALUES ?";//(" + req.body.vorname + ", " + req.body.nachname + ", " + req.body.mail + ", " + req.body.username + ", ANFANGSPW, " + req.body.status +", " + req.body.strasse + ", " + req.body.stadt + ")";

    var values = [[req.body.vorname, req.body.nachname, req.body.mail, req.body.username, "ANFANGSPW", req.body.status, req.body.strasse, req.body.stadt, req.body.position, req.body.geburtstag]];
    console.log(squery);
    connection.query(squery, [values], function(err, result) {
        var lastid = result.insertId;

        squery = "INSERT INTO mannschaftszuweisung (MannschaftsID, SpielerID) VALUES ?";
        for(entry of req.body.mannschaft) {
            values = [[entry, lastid]];
            connection.query(squery, [values], function(err, result) {
                res.end();
            });
        }
               
        
    })
});

app.post("/mannschaften", (req, res) => {
    var mannschaften = [];
    squery = "SELECT Bezeichnung, MannschaftsID FROM mannschaften WHERE SpielerID = ?";

    connection.query(squery, req.session.usid, function(err, result) {
        for(entry of result) {
            mannschaften.push(entry);
        }
        res.send(mannschaften);
    });
});

app.post("/useredit", (req, res) => {
    var squery = "SELECT NutzerID FROM user WHERE vorname='" + req.body.vorname + "' AND nachname='" + req.body.nachname + "' AND email='" + req.body.mail + "'";
    
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
                        res.end();
                    });
                }
            });
        });
    });
});

app.post("/deleteuser", (req, res) => {
    var squery = "DELETE FROM user WHERE NutzerID = " + req.body.userid;
    connection.query(squery, function(err, result) {
        squery = "DELETE FROM mannschaftszuweisung WHERE SpielerID = " + req.body.userid;
        connection.query(squery, function(err, result) {
            squery = "DELETE FROM trainingszuweisung WHERE SpielerID = " + req.body.userid;
            connection.query(squery, function(err, result) {
                res.end();
            });
        });
    });
});

function removeDuplicates(originalArray, prop) {
    var newArray = [];
    var lookupObject  = {};

    for(var i in originalArray) {
       lookupObject[originalArray[i][prop]] = originalArray[i];
    }

    for(i in lookupObject) {
        newArray.push(lookupObject[i]);
    }
     return newArray;
}

app.listen(5000);
