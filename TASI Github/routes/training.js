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

//ROUTE achievements GET
router.get("/achievements", (req, res) => {	
	var uebungen = {};
	var uebungsBezeichnungen = [];
	var uebungsIDs = [];
		
	var getAchievements = function(callback){	
		squery = "SELECT * FROM achievements WHERE NutzerID = " + req.session.usid;
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
				achievements: 0,
				selectedUebung: 0
			});
		});
	});
});

//ROUTE achievements POST
router.post("/achievements", (req, res) => {
	var getAchievementsByUebung = function(callback){	
		squery = "SELECT * FROM achievements WHERE NutzerID = " + req.session.usid + " AND UebungsID = " + session.uebung;
		connection.query(squery, function(err, result) {
			  if(err){
				  console.log(err);	
			  }else{
				  callback(result);
			  }
		});
	}	
	
	var getSelectedUebung = function(uebungsID, callback){
		squery = "SELECT Bezeichnung FROM uebungen WHERE UebungsID = " + session.uebung;
		connection.query(squery, function(err, result) {
			  if(err){
				  console.log(err);	
			  }else{
				  callback(result);
			  }
		});
	};
	
	var getWerte = function(){
		var WiederholungenArr = [];
		var EvaluationArr = [];
		var DauerSecArr = [];
		var DauerMinArr = [];
		var StreckeMeterArr = [];
		achievementsObj = {};
		
		getSelectedUebung(session.uebung, function(selectedUebung){
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
					achievements: achievementsObj,
					selectedUebung: selectedUebung
				});
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

//ROUTE overview GET
router.get("/overview", (req, res) => {		
	var getMannschaftszuweisung = function(callback){
		squery = "SELECT * FROM mannschaftszuweisung";
		connection.query(squery, function(err, result) {
			  if(err){
				  console.log(err);	
			  }else{
			  	  callback(result);
			  };
		});		
	}
	
	var getMannschaften = function(callback){
		squery = "SELECT * FROM mannschaften";
		connection.query(squery, function(err, result) {
			  if(err){
				  console.log(err);	
			  }else{
			  	  callback(result);
			  };
		});			
	};	
	
	var getSpieler = function(callback){
		squery = "SELECT * FROM user";
		connection.query(squery, function(err, result) {
			  if(err){
				  console.log(err);	
			  }else{
			  	  var spielerArr = [];
				  for(entry of result){
				  	  	var MannschaftenArr = [];
						var spieler = {
							  NutzerID: entry.NutzerID,
							  Vorname: entry.vorname,
							  Nachname: entry.nachname,
							  Mannschaften: MannschaftenArr
						};
						spielerArr.push(spieler);
				  };
			  };
			  callback(spielerArr);
		});	
	};
	
	getSpieler(function(spielerArr){
		getMannschaftszuweisung(function(mannschaftszuweisung){
			getMannschaften(function(mannschaften){
				spielerArr.forEach(function(spieler){
					mannschaftszuweisung.forEach(function(zuweisung){
						if(spieler.NutzerID == zuweisung.SpielerID){
							mannschaften.forEach(function(mannschaft){
								if(zuweisung.MannschaftsID == mannschaft.MannschaftsID){
									spieler.Mannschaften.push(mannschaft.Bezeichnung);
								};
							});
						};
					});
				});
				var achievementsArr = [];
				res.render("overview", {
					roleid: req.session.roleid,
					spieler: spielerArr,
				});
			});
		});
	});

});

router.post("/overview", (req, res) => {	
	var getAchievements = function(NutzerID, callback){
		var UebungsIDs = [];
		var UebungsattributIDs = [];
		squery = "SELECT * FROM achievements WHERE NutzerID = " + NutzerID;
		connection.query(squery, function(err, result) {
			  if(err){
				  console.log(err);	
			  }else{
			  	  for(entry of result){
			  	  	  UebungsIDs.push(entry.UebungsID);
			  	  	  UebungsattributIDs.push(entry.UebungsattributID);
			  	  };
			  	  callback(UebungsIDs, UebungsattributIDs, result);
			  };
		});		
	};
	
	var getUebungen = function(UebungsIDs, callback){
		squery = "SELECT * FROM uebungen WHERE UebungsID IN (" + UebungsIDs + ")";
		connection.query(squery, function(err, result) {
			  if(err){
				  console.log(err);	
			  }else{
			  	  callback(result);
			  };
		});			
	};
	
	var getAttribute = function(UebungsattributIDs, callback){
		squery = "SELECT * FROM uebungsattribute WHERE UebungsattributID IN (" + UebungsattributIDs + ")";
		connection.query(squery, function(err, result) {
			  if(err){
				  console.log(err);	
			  }else{
			  	  callback(result);
			  };
		});
	};
	
	//Suche alle Teamkollegen eines Spielers
	var getTeamkollegen = function(NutzerID, callback){
		squery = "SELECT SpielerID FROM mannschaftszuweisung WHERE MannschaftsID = (SELECT MannschaftsID FROM mannschaftszuweisung WHERE SpielerID = " + NutzerID + ")";
		connection.query(squery, function(err, result) {
			  if(err){
				  console.log(err);	
			  }else{
			  	  var spielerArr = [];
			  	  for(entry of result){
			  	  	 spielerArr.push(entry.SpielerID); 
			  	  };
			  	  callback(spielerArr);
			  };
		});	
	};
	
	//Suche alle Werte einer bestimmten Uebung, anhand von Spielern, die diese absolviert haben
	var getAllAchievements = function(UebungsID, spielerArr, callback){
		squery = "SELECT Wert FROM achievements WHERE UebungsID = " + UebungsID + " AND NutzerID IN (" + spielerArr + ")";;
		connection.query(squery, function(err, result) {
			  if(err){
				  console.log(err);	
			  }else{
			  	  callback(result);
			  };
		});	
	};

	if(req.body.NutzerID){
		var achievementArr = [];
		var achievementAll = [];
		session.NutzerID = req.body.NutzerID;
		getAchievements(req.body.NutzerID, function(UebungsIDs, UebungsattributIDs, achievements){	
			getAttribute(UebungsattributIDs, function(uebungsattribute){	
				getUebungen(UebungsIDs, function(uebungen){
					for(achievement of achievements){
						for(uebung of uebungen){
							if(achievement.UebungsID == uebung.UebungsID){	
								session.UebungsID = uebung.UebungsID;
								for(uebungsattribut of uebungsattribute){
									if(uebungsattribut.UebungsattributID == achievement.UebungsattributID){
										var achievementObj = {
											UebungsID: uebung.UebungsID,
											Bezeichnung: uebung.Bezeichnung,
											Wert: achievement.Wert,
											Uebungsattribut: uebungsattribut.Bezeichnung,
											Datum: achievement.Datum,
										};
										achievementArr.push(achievementObj);
									}
								};
							};	
						};	
					};
					res.send(achievementArr);
				});
			});
		});	
	};	
	
	if(req.body.compare){
		getTeamkollegen(session.NutzerID, function(spielerArr){
			getAllAchievements(req.body.UebungsID, spielerArr, function(achievementsMannschaft){
					console.log(achievementsMannschaft);
					res.send(achievementsMannschaft);
			});
		});
	};

});

//ROUTE training GET
router.get("/training", (req, res) => {	
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
		res.render("training", {
			uebung: uebung,
			allplans: allplans,
			roleid: req.session.roleid,
			uebungsattribute: 0,
			training: 0
		});
	});
});

//ROUTE training POST
router.post("/training", (req, res) => {
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
	
	var getUebungsIDs = function(trainingsID, callback){
		squery = "SELECT UebungsID FROM uebungszuweisung WHERE TrainingsID = " + trainingsID;
		connection.query(squery, function(err, result) {
			for(entry of result){
				uebungsIDs.push(entry.UebungsID);
			}
			callback(uebungsIDs);
		});
	}
	
	var getUebungen = function(uebungsIDs, callback){
		squery = "SELECT * FROM uebungen  WHERE UebungsID IN (" + uebungsIDs + ")" ;
		connection.query(squery, function(err, result) {
				callback(result);
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
					getUebungsIDs(req.body.trainingsID, function(uebungsIDs){
						getUebungen(uebungsIDs, function(uebungen){
								console.log(training);
							res.render("training", {
								uebung: uebungen,
								allplans: allplans,
								roleid: req.session.roleid,
								uebungsattribute: uebungsattribute,
								training: training
							});
						});
					});
				});
			});

	}
                    
	if(req.body.uebungsID){
		session.uebungsID = req.body.uebungsID;
		getUebungsattribute(session.uebungsID, function(uebungsattribute){
				res.send(uebungsattribute);
				res.end();
		});
	}

// Vom Formular empfangene Werte in die Datenbank eintragen
	if(req.body.uebungsattribut){	
		var date = new Date();
		for(var key in req.body) {
		  if(req.body.hasOwnProperty(key)){
		  	  if(key==1){
		  	  	  squery = "INSERT INTO achievements (UebungsID, UebungsattributID, NutzerID, Datum, Wert) VALUES ?";
		  	  	  values = [[session.uebungsID, key, req.session.usid, date, req.body[key]]];
		  	  	  connection.query(squery, [values], function(err, result) {
		  	  	  		  if(err){
		  	  	  		  	  console.log(err);	
		  	  	  		  }else{
		  	  	  		  	  
		  	  	  		  }
		  	  	  });
		  	  }
		  	  
		  	  if(key==2){
		  	  	  console.log("Einschätzung: " + req.body[key]);
		  	  	  squery = "INSERT INTO achievements (UebungsID, UebungsattributID, NutzerID, Datum, Wert) VALUES ?";
		  	  	  values = [[session.uebungsID, key, req.session.usid, date, req.body[key]]];
		  	  	  connection.query(squery, [values], function(err, result) {
		  	  	  		  if(err){
		  	  	  		  	  console.log(err);	
		  	  	  		  }else{

		  	  	  		  }
		  	  	  });
		  	  }
		  	  
		  	  if(key==3){
		  	  	  console.log("Dauer in sec.: " + req.body[key]);
		  	  	  squery = "INSERT INTO achievements (UebungsID, UebungsattributID, NutzerID, Datum, Wert) VALUES ?";
		  	  	  values = [[session.uebungsID, key, req.session.usid, date, req.body[key]]];
		  	  	  connection.query(squery, [values], function(err, result) {
		  	  	  		  if(err){
		  	  	  		  	  console.log(err);	
		  	  	  		  }else{

		  	  	  		  }
		  	  	  });
		  	  }
		  	  
		  	 if(key==4){
		  	  	  console.log("Strecke in Meter: " + req.body[key]);
		  	  	  squery = "INSERT INTO achievements (UebungsID, UebungsattributID, NutzerID, Datum, Wert) VALUES ?";
		  	  	  values = [[session.uebungsID, key, req.session.usid, date, req.body[key]]];
		  	  	  connection.query(squery, [values], function(err, result) {
		  	  	  		  if(err){
		  	  	  		  	  console.log(err);	
		  	  	  		  }else{

		  	  	  		  }
		  	  	  });
		  	  }
		  	  
		  	 if(key==5){
		  	  	  console.log("Dauer in min.: " + req.body[key]);
		  	  	  squery = "INSERT INTO achievements (UebungsID, UebungsattributID, NutzerID, Datum, Wert) VALUES ?";
		  	  	  values = [[session.uebungsID, key, req.session.usid, date, req.body[key]]];
		  	  	  connection.query(squery, [values], function(err, result) {
		  	  	  		  if(err){
		  	  	  		  	  console.log(err);	
		  	  	  		  }else{

		  	  	  		  }
		  	  	  });
		  	  }  
		  }
		}
		res.send(true);
	}	
});

module.exports = router;















