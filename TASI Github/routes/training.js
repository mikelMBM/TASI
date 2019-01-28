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

//ROUTE training
router.get("/training", (req, res) => {
    if(req.session.roleid == 1) {
        squery = "SELECT TrainingsID FROM training WHERE TrainerID = ?";
        connection.query(squery, req.session.usid, function(err, result) {

            var id = result[0].TrainingsID;
            var url = "/training/" + id;
            res.redirect(url);
        });
    }else if(req.session.roleid == 2) {
        squery =    "SELECT training.TrainingsID, training.Bezeichnung FROM training, trainingszuweisung " + 
                    "WHERE training.TrainingsID = trainingszuweisung.TrainingsID AND SpielerID = ?";
        connection.query(squery, req.session.usid, function(err, result) {
            var id = result[0].TrainingsID;
            var url = "/training/" + id;
            res.redirect(url);
        });
    }
});

//ROUTE training/id
router.get("/training/:id", (req, res) => {
    var train = req.params.id;
    var squery = "";
    
	var getTrainingsbezeichnung = function(callback){
		squery = "SELECT training.Bezeichnung FROM training WHERE TrainingsID = ?";
		connection.query(squery, train, function(err, result, fields) {
			var trainingsbezeichnung = result[0].Bezeichnung;
			callback(trainingsbezeichnung);
		});
	};
	
    var getUebungen = function(callback){
		var uebungsArr = [];
		var uebungsIDArr = [];
		squery = 	"SELECT uebungen.UebungsID, uebungen.Bezeichnung, uebungen.Kategorie, uebungen.Unterkategorie, uebungen.Dauer, uebungen.Niveau, uebungen.Video, uebungen.Beschreibung " +
					"FROM uebungen, uebungszuweisung " +
					"WHERE uebungen.UebungsID = uebungszuweisung.UebungsID " +
					"AND uebungszuweisung.TrainingsID = ?";        
		connection.query(squery, train, function(err, result, fields) {
			  for(entry of result) {
			  	  uebungsArr.push(entry);
			  	  uebungsIDArr.push(entry.UebungsID);
			  };
			  callback(uebungsArr, uebungsIDArr);
		});          
    };
    
    var getHilfsmittel = function(trainingsbezeichnung, uebungsIDArr, uebungsArr, callback){
		squery =    "SELECT hilfsmittel.Bezeichnung, uebungsID " +
					"FROM hilfsmittel, hilfsmittelzuweisung " +
					"WHERE hilfsmittel.HilfsmittelID = hilfsmittelzuweisung.HilfsmittelID " +
					"AND hilfsmittelzuweisung.uebungsID IN (" + uebungsIDArr + ")";
		connection.query(squery, function(err, result, fields){
			for(entry of result){
				for(i=0; i<uebungsArr.length; i++){
					if(uebungsArr[i].UebungsID == entry.uebungsID){
						uebungsArr[i].Hilfsmittel = entry.Bezeichnung;
					};
				};
			};
			callback(uebungsArr);
		});
    };
    
    var getAllPlans = function(callback){
    	var allplans = [];
		if(req.session.roleid == 1) {
			squery = "SELECT TrainingsID, Bezeichnung FROM training WHERE TrainerID = ?";
			connection.query(squery, req.session.usid, function(err, result) {
				for(entry of result) {
					allplans.push(entry);
				};
				callback(allplans);
			});
		};
		if(req.session.roleid == 2) {
			squery =    "SELECT training.TrainingsID, training.Bezeichnung FROM training, trainingszuweisung " + 
						"WHERE training.TrainingsID = trainingszuweisung.TrainingsID AND SpielerID = ?";
	
			connection.query(squery, req.session.usid, function(err, result) {
				for(entry of result) {
					allplans.push(entry);
				};
				callback(allplans);
			});
		};
    };
    
    getTrainingsbezeichnung(function(trainingsbezeichnung){
    	getUebungen(function(uebungsArr, uebungsIDArr){
			getHilfsmittel(trainingsbezeichnung, uebungsIDArr, uebungsArr, function(uebungsArr){	
				getAllPlans(function(allplans){
					res.render("training", {
						trainingsbezeichnung: trainingsbezeichnung,
						uebung: uebungsArr ,
						allplans: allplans,
						roleid: req.session.roleid
					});
				});
			});
    	});
    });

});

module.exports = router;