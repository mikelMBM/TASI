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

//ROUTE uebungssammlung
router.get("/uebungssammlung", (req, res) => {
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

//ROUTE uebungssammlung/uebung
router.get("/uebungssammlung/uebung/:id", (req, res) => {
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

//ROUTE favo
router.post("/favo", (req, res) => {
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

//ROUTE adduebung
router.post("/adduebung", (req, res) => {
    var squery = "INSERT INTO uebungszuweisung (UebungsID, TrainingsID) VALUES (" + req.body.uebung + ", " + req.body.plan + ")";
    connection.query(squery, function(err, result) {
        res.redirect("/uebungssammlung/uebung/" + req.body.uebung);
    });
});

//ROUTE uebunganzeigen
router.get("/uebunganzeigen/:id/:training", (req,res) => {

	var getUebungsattribute = function(uebungsID, callback){
		var attributeIDs = [];
		squery = "SELECT UebungsattributID FROM attributzuweisung WHERE UebungsID = " + uebungsID;	
		connection.query(squery, function(err, result) {
			for(entry of result){
				attributeIDs.push(entry.UebungsattributID);	
			}
			squery = "SELECT * FROM uebungsattribute WHERE UebungsattributID IN (" + attributeIDs + ")" ;
			connection.query(squery, function(err, result) {
				callback(result);
			});  
		});
	}
	
    var ueb = req.params.id;
    session.uebungsID = ueb;
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
            
           getUebungsattribute(ueb, function(uebungsattribute){
           		var attributes ='';
				uebungsattribute.forEach(function(entry){
					attributes += '<label>' + entry.Bezeichnung + '</label><br>';
					attributes += '<input type="text" name="' + entry.UebungsattributID + '" placeholder="Ergebnis"><br><br>';
				});
				res.write('<div class="grid_6" id="ergebnisse"><h4>Ergebnisse eintragen:</h4><form onSubmit="insert(this); return false"><input type="hidden" name="uebungsattribut" value="uebungsattribut">' + attributes + '<input class="btn" type="submit" value="eintragen"></form></div></br><br>');
           		res.write('<div class="grid_6"><button class="btn-link" id="switch" value="off" onclick="details(this.value)">Informationen zur  Übung einblenden</button></div>');
				res.write('<div class="grid_6" id="uebungsdetails" style="visibility:hidden; margin-top:20px">');
				res.write('<div class="grid_6" id="uebungsbezeichnung"><h4>' + uebungsname + '</h4></div>');
				res.write('<div class="grid_6"><iframe src="' + video + '" width="460" height="260" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen=""></iframe>');
				res.write('<div id="bereich"><p>Kategorie: ' + uebungskat + ' | Unterkategorie: ' + uebungssubkat + ' | Niveau: ' + niveau + ' | Hilfsmittel: ' + hilfsmittel + ' | Dauer: ' + dauer + '</p></div>');
				res.write(beschreibung + ' <br><br>');   
				res.write('</div>');
				res.end();
           });
        });
    });
});


module.exports = router;