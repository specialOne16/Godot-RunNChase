extends Control

export var gamemode := "2PKeyboard"
export var deltas = 1000
onready var score := get_node("Label")

func _ready():
	GameData.connect("update_score",self,"update_ui_score_"+gamemode)

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		GameData.resetScore()
		get_tree().change_scene("res://uiscreen/main_screen.tscn")
		get_tree().paused = false
		get_parent().get_parent().queue_free()

func update_ui_score_2PJoystick():
	var p1 = GameData.scoreP3
	var p2 = GameData.scoreP4
	score.text = str(p1) + " vs " + str(p2)
	if p1 >= deltas:
		get_tree().paused = true
		score.text += "\nPlayer Kabel 2 menang"
	if p2 >= deltas:
		get_tree().paused = true
		score.text += "\nPlayer Kabel 1 menang"
		
func update_ui_score_2PKeyboard():
	var p1 = GameData.scoreP1
	var p2 = GameData.scoreP2
	score.text = str(p1) + " vs " + str(p2)
	if p1 >= deltas:
		get_tree().paused = true
		score.text += "\nPlayer WASD menang"
	if p2 >= deltas:
		get_tree().paused = true
		score.text += "\nPlayer D-pad menang"
		
func update_ui_score_NPlayer():
	var p1 = int(GameData.scoreP1)
	var p2 = int(GameData.scoreP2)
	var p3 = int(GameData.scoreP3)
	var p4 = int(GameData.scoreP4)
	var scoreView =  ""
	
	if GameData.isActiveP1:
		scoreView += str(p1) + " vs " 
	if GameData.isActiveP2:
		scoreView += str(p2) + " vs " 
	if GameData.isActiveP3:
		scoreView += str(p3) + " vs " 
	if GameData.isActiveP4:
		scoreView += str(p4) + " vs " 
	if scoreView.length() > 0:
		scoreView.erase(scoreView.length()-4,4)
	
	score.text = scoreView
	
	var winScore = deltas * GameData.playerCount
	if p1 >= winScore:
		get_tree().paused = true
		score.text += "\nPlayer WASD menang"
	if p2 >= winScore:
		get_tree().paused = true
		score.text += "\nPlayer D-pad menang"
	if p3 >= winScore:
		get_tree().paused = true
		score.text += "\nPlayer Kabel 2 menang"
	if p4 >= winScore:
		get_tree().paused = true
		score.text += "\nPlayer Kabel 1 menang"
		
