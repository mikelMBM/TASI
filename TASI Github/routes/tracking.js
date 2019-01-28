var express = require('express');
var router = express.Router();
var session = require("express-session");
var parser = require("body-parser");
var cookieParser = require("cookie-parser");
var mysql = require("mysql");

//Initialisiere Datenbankverbindung
var connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "tasi",
    port: "3306"
});

//ROUTE tracking GET
router.get("/tracking", (req, res) => {	
	trainingsID = 1;
	var allplans = [];
	var uebung = [];
				
	var getPlans = function(callback){
		if(req.session.roleid == 1) {
			squery = "SELECT TrainingsID, Bezeichnung FROM training WHERE TrainerID = " + req.session.usid;
			connection.query(squery, function(err, result) {
				for(entry of result) {
					allplans.push(entry);
				}callback(allplans);
			});
		}
		
		if(req.session.roleid == 2) {
			var TrainingsIDArr = [];
			squery = "SELECT TrainingsID FROM trainingszuweisung WHERE SpielerID = " + req.session.usid;
			connection.query(squery, function(err, result) {
				for(entry of result) {
					TrainingsIDArr.push(entry.TrainingsID);
				}
				squery = "SELECT TrainingsID, Bezeichnung FROM training WHERE TrainingsID IN (" + TrainingsIDArr + ")" ;
				connection.query(squery, function(err, TrainingsIDs) {
				for(entry of TrainingsIDs) {
					allplans.push(entry);
				}callback(allplans);
			});
				
			});
		}
	}		

	getPlans(function(allplans){
		res.render("tracking", {
			uebung: uebung,
			allplans: allplans,
			roleid: req.session.roleid,
			uebungsattribute: 0
		});
	});
});

//ROUTE tracking POST
router.post("/tracking", (req, res) => {
	var uebungsIDs = [];
	var allplans = [];
	var uebung = [];
          
	var getTrainingsBezeichnung = function(trainingsID, callback){
		var squery = "SELECT Bezeichnung FROM training WHERE TrainingsID = " + trainingsID;
		connection.query(squery, function(err, result) {
			callback(result);
		});
	}
				
	var getPlans = function(callback){
		if(req.session.roleid == 1) {
			squery = "SELECT TrainingsID, Bezeichnung FROM training WHERE TrainerID = " + req.session.usid;
			connection.query(squery, function(err, result) {
				for(entry of result) {
					allplans.push(entry);
				}callback(allplans);
			});
		}
		
		if(req.session.roleid == 2) {
			var TrainingsIDArr = [];
			squery = "SELECT TrainingsID FROM trainingszuweisung WHERE SpielerID = " + req.session.usid;
			connection.query(squery, function(err, result) {
				for(entry of result) {
					TrainingsIDArr.push(entry.TrainingsID);
				}
				squery = "SELECT TrainingsID, Bezeichnung FROM training WHERE TrainingsID IN (" + TrainingsIDArr + ")" ;
				connection.query(squery, function(err, TrainingsIDs) {
				for(entry of TrainingsIDs) {
					allplans.push(entry);
				}callback(allplans);
			});
				
			});
		}
	}
				
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
	
	var getUebungsIDs = function(trainingsID, allplans, training, uebungsattribute){
		squery = "SELECT UebungsID FROM uebungszuweisung WHERE TrainingsID = " + trainingsID;
		connection.query(squery, function(err, result) {
			for(entry of result){
				uebungsIDs.push(entry.UebungsID);
			}getUebungen(uebungsIDs, allplans, training, uebungsattribute);
		});
	}
	
	var getUebungen = function(uebungsIDs, allplans, training, uebungsattribute){
		squery = "SELECT * FROM uebungen  WHERE UebungsID IN (" + uebungsIDs + ")" ;
		connection.query(squery, function(err, result) {
			res.render("tracking", {
				uebung: result,
				allplans: allplans,
				roleid: req.session.roleid,
				uebungsattribute: uebungsattribute
			});
		});
	}
	
	var getUebungsBezeichnung = function(uebungsID, callback){
		squery = "SELECT Bezeichnung FROM uebungen  WHERE UebungsID = " + uebungsID;
		connection.query(squery, function(err, result) {
			callback(result);
		});
	};
		
	if(req.body.trainingsID){
		session.trainingsID = req.body.trainingsID;
		uebungsattribute = 0;
			getTrainingsBezeichnung(req.body.trainingsID, function(training){
				getPlans(function(allplans){
					getUebungsIDs(req.body.trainingsID, allplans, training, uebungsattribute);
				});
			});

	}
                    
	if(req.body.uebung){
		session.uebungsID = req.body.uebung;
		getUebungsattribute(session.uebungsID, function(uebungsattribute){
			getTrainingsBezeichnung(session.trainingsID, function(training){
				getPlans(function(allplans){
					getUebungsIDs(session.trainingsID, allplans, training, uebungsattribute);
				});
			});
		});
	}

// Vom Formular empfangene Werte in die Datenbank eintragen
	if(req.body.uebungsattribut){	
		var date = new Date();
		for(var key in req.body) {
		  if(req.body.hasOwnProperty(key)){
		  	  if(key==1){
		  	  	  console.log("Wiederholungen: " + req.body[key]);
		  	  	  squery = "INSERT INTO achievements (UebungsID, UebungsattributID, NutzerID, Datum, Wert) VALUES ?";
		  	  	  values = [[session.uebungsID, key, req.session.roleid, date, req.body[key]]];
		  	  	  connection.query(squery, [values], function(err, result) {
		  	  	  		  if(err){
		  	  	  		  	  console.log(err);	
		  	  	  		  }else{
		  	  	  		  	  console.log(result);
		  	  	  		  }
		  	  	  });
		  	  }
		  	  
		  	  if(key==2){
		  	  	  console.log("Einschätzung: " + req.body[key]);
		  	  	  squery = "INSERT INTO achievements (UebungsID, UebungsattributID, NutzerID, Datum, Wert) VALUES ?";
		  	  	  values = [[session.uebungsID, key, req.session.roleid, date, req.body[key]]];
		  	  	  connection.query(squery, [values], function(err, result) {
		  	  	  		  if(err){
		  	  	  		  	  console.log(err);	
		  	  	  		  }else{
		  	  	  		  	  console.log(result);
		  	  	  		  }
		  	  	  });
		  	  }
		  	  
		  	  if(key==3){
		  	  	  console.log("Dauer in sec.: " + req.body[key]);
		  	  	  squery = "INSERT INTO achievements (UebungsID, UebungsattributID, NutzerID, Datum, Wert) VALUES ?";
		  	  	  values = [[session.uebungsID, key, req.session.roleid, date, req.body[key]]];
		  	  	  connection.query(squery, [values], function(err, result) {
		  	  	  		  if(err){
		  	  	  		  	  console.log(err);	
		  	  	  		  }else{
		  	  	  		  	  console.log(result);
		  	  	  		  }
		  	  	  });
		  	  }
		  	  
		  	 if(key==4){
		  	  	  console.log("Strecke in Meter: " + req.body[key]);
		  	  	  squery = "INSERT INTO achievements (UebungsID, UebungsattributID, NutzerID, Datum, Wert) VALUES ?";
		  	  	  values = [[session.uebungsID, key, req.session.roleid, date, req.body[key]]];
		  	  	  connection.query(squery, [values], function(err, result) {
		  	  	  		  if(err){
		  	  	  		  	  console.log(err);	
		  	  	  		  }else{
		  	  	  		  	  console.log(result);
		  	  	  		  }
		  	  	  });
		  	  }
		  	  
		  	 if(key==5){
		  	  	  console.log("Dauer in min.: " + req.body[key]);
		  	  	  squery = "INSERT INTO achievements (UebungsID, UebungsattributID, NutzerID, Datum, Wert) VALUES ?";
		  	  	  values = [[session.uebungsID, key, req.session.roleid, date, req.body[key]]];
		  	  	  connection.query(squery, [values], function(err, result) {
		  	  	  		  if(err){
		  	  	  		  	  console.log(err);	
		  	  	  		  }else{
		  	  	  		  	  console.log(result);
		  	  	  		  }
		  	  	  });
		  	  }
		  	  
		  	  
		  }
		}
	}	
});

//ROUTE achievements GET
router.get("/achievements", (req, res) => {	
	var uebungen = {};
	var uebungsBezeichnungen = [];
	var uebungsIDs = [];
		
	var getAchievements = function(callback){	
		squery = "SELECT * FROM achievements WHERE NutzerID = " + req.session.roleid;
		connection.query(squery, function(err, result) {
			  if(err){
				  console.log(err);	
			  }else{
				  callback(result);
			  }
		});
	}
	
	var getAllUebungen = function(callback){
		squery = "SELECT UebungsID, Bezeichnung FROM uebungen";
		connection.query(squery, function(err, result) {
			  if(err){
				  console.log(err);	
			  }else{
				  callback(result);
			  }
		});
	}
		
	getAchievements(function(achievements){
		getAllUebungen(function(AllUebungen){
			AllUebungen.forEach(function(uebung){
				achievements.forEach(function(achievement){
					if(achievement.UebungsID == uebung.UebungsID){
						if(!uebungsIDs.includes(uebung.UebungsID)){
							uebungsIDs.push(uebung.UebungsID);	
							uebungsBezeichnungen.push(uebung.Bezeichnung);
						}
					}
				});
			});
			uebungen.UebungsIDs = uebungsIDs;
			uebungen.UebungsBezeichnungen = uebungsBezeichnungen;

			session.uebungen = uebungen;
			res.render("achievements", {
				roleid: req.session.roleid,
				uebungen: uebungen,
				achievements: 0
			});
		});
	});
});

//ROUTE achievements POST
router.post("/achievements", (req, res) => {
	var getAchievementsByUebung = function(callback){	
		squery = "SELECT * FROM achievements WHERE NutzerID = " + req.session.roleid + " AND UebungsID = " + session.uebung;
		connection.query(squery, function(err, result) {
			  if(err){
				  console.log(err);	
			  }else{
				  callback(result);
			  }
		});
	}	
	
	var getWerte = function(){
		var WiederholungenArr = [];
		var EvaluationArr = [];
		var DauerSecArr = [];
		var DauerMinArr = [];
		var StreckeMeterArr = [];
		achievementsObj = {};
			
		getAchievementsByUebung(function(achievements){
			achievements.forEach(function(achievement){
				if(achievement.UebungsattributID == 1){
					var Datum = new Date(achievement.Datum);	
					var WertObj = {
						Wert: achievement.Wert,
						ID: achievement.AchievementID,
						Datum: Datum
					};
					WiederholungenArr.push(WertObj);
					achievementsObj.Wiederholungen = WiederholungenArr;
				}		
				if(achievement.UebungsattributID == 2){
					var Datum = new Date(achievement.Datum);	
					var WertObj = {
						Wert: achievement.Wert,
						ID: achievement.AchievementID,
						Datum: Datum
					};
					EvaluationArr.push(WertObj);
					achievementsObj.Evaluation = EvaluationArr;
				}	
				if(achievement.UebungsattributID == 3){
					var Datum = new Date(achievement.Datum);	
					var WertObj = {
						Wert: achievement.Wert,
						ID: achievement.AchievementID,
						Datum: Datum
					};			
					DauerSecArr.push(WertObj);
					achievementsObj.DauerSec = DauerSecArr;
				}	
				if(achievement.UebungsattributID == 4){
					var Datum = new Date(achievement.Datum);	
					var WertObj = {
						Wert: achievement.Wert,
						ID: achievement.AchievementID,
						Datum: Datum
					};			
					StreckeMeterArr.push(WertObj);
					achievementsObj.StreckeMeter = StreckeMeterArr;
				}	
				if(achievement.UebungsattributID == 5){
					var Datum = new Date(achievement.Datum);	
					var WertObj = {
						Wert: achievement.Wert,
						ID: achievement.AchievementID,
						Datum: Datum
					};			
					DauerMinArr.push(WertObj);
					achievementsObj.DauerMin = DauerMinArr;
				}	
			});

			res.render("achievements", {
				roleid: req.session.roleid,
				uebungen: session.uebungen,
				achievements: achievementsObj
			});

		});
	}
	
	if(req.body.uebung){
		session.uebung = req.body.uebung;
		getWerte();
	};
	
	if(req.body.achievementChange){
		if(req.body.achievementWert){
			squery = "UPDATE achievements SET Wert = " + req.body.achievementWert + " WHERE AchievementID = " + req.body.achievementChange;
			var redirectString = {uebung: session.uebung};
			connection.query(squery, function(err, result) {
				  if(err){
					  console.log(err);	
				  }else{
				  	  getWerte();
				  }
			});			
		}
	}
	
});

//ROUTE tracking GET
router.get("/overview", (req, res) => {	
		res.render("overview", {
			roleid: req.session.roleid	
		});;
});

module.exports = router;