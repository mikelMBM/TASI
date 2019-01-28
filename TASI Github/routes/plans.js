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

//ROUTE saveplan
router.post("/saveplan", (req,res) => {

    var mannschaft = req.body.mannschaft;
    var uebungen = req.body.uebungen;
    var spieler = req.body.spieler;
    var bezeichnung = req.body.bezeichnung;
    var beschreibung = req.body.beschreibung;
    var uebungenid = [];
    var usid = req.session.usid;

    if(mannschaft != "Mannschaft") {
        var squery = "INSERT INTO training (Bezeichnung, Zeitraum, beschreibung, TrainerID, MannschaftsID) VALUES ( '" + bezeichnung + "' , NOW(), '" + beschreibung + "', " + usid  + ", " + mannschaft + ")";
        connection.query(squery, function(err, result) {
            var lastid = result.insertId;
            for(entry of uebungen) {
                squery = "INSERT INTO uebungszuweisung (UebungsID, TrainingsID) VALUES ?";
                values = [[entry, lastid]];
                connection.query(squery, [values], function(err, result) {
  
                });

            };
            res.send(true);
        });
    } else if(spieler != "Spieler") {
        var squery = "INSERT INTO training (Bezeichnung, Zeitraum, beschreibung, TrainerID) VALUES ( '" + bezeichnung + "' , NOW(), '" + beschreibung + "', " + usid  + ")";
        connection.query(squery, function(err, result){
        	var lastid = result.insertId;
            squery = "INSERT INTO trainingszuweisung (TrainingsID, SpielerID) VALUES ?";
            values = [[lastid, spieler]];

            connection.query(squery, [values], function(err, result) {
                for(entry of uebungen) {

                    squery = "INSERT INTO uebungszuweisung (UebungsID, TrainingsID) VALUES ?";
                    values = [[entry, lastid]];
                    connection.query(squery, [values], function(err, result) {

                    });
                };
            });
        });
        res.send(true);
    };
    
});

//ROUTE changeplan
router.post("/changeplan", (req,res) => {
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

//ROUTE filter
router.post("/filter", (req, res) => {
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

//ROUTE filter3
router.post("/filter3", (req, res) => {
    
    
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

//ROUTE calluebungen
router.post("/calluebungen", (req,res) => {
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

//ROUTE createtrainingplan
router.get("/createtrainingplan", (req, res) => {
    var uebungen = [];
    var mannschaft = [];
    var spieler = [];
    var plans = [];
    var e = 0;
    var f = 0;
    
	var removeDuplicates = function(originalArray, prop) {
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


module.exports = router;