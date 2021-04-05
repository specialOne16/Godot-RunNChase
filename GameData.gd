extends Node

signal update_score

var scoreP1 := 0 setget setScoreP1
var scoreP2 := 0 setget setScoreP2
var scoreP3 := 0 setget setScoreP3
var scoreP4 := 0 setget setScoreP4

var player1Skill = "Higher Jump"
var player2Skill = "Higher Jump"
var player3Skill = "Higher Jump"
var player4Skill = "Higher Jump"

var isActiveP1 := false
var isActiveP2 := false
var isActiveP3 := false
var isActiveP4 := false

var playerCount = 4

func setScoreP1(value):
	scoreP1 = value
	emit_signal("update_score")
	
func setScoreP2(value):
	scoreP2 = value
	emit_signal("update_score")
	
func setScoreP3(value):
	scoreP3 = value
	emit_signal("update_score")
	
func setScoreP4(value):
	scoreP4 = value
	emit_signal("update_score")
	
func resetScore():
	GameData.playerCount = 4
	GameData.scoreP1 = 0
	GameData.scoreP2 = 0
	GameData.scoreP3 = 0
	GameData.scoreP4 = 0
