extends Node

var BulletInstanceCount = 0 #Keep track in the bullet numbers
var enemyBulletInstanceCount = 0 #Keep track in the enemy bullet numbers
var AutoFiring = false
var Player 

var Filesave = "user://save.dat"

var ScoringInformation = {
	"currentScore": 0,
	"currentPlayer": "Beta tester",
	"highScore": [0, 0, 0],
	"highScorePlayerName": "Are ya winning son",
}
