extends Control

const JUMP = "Higher Jump"
const DASH = "Dashing Speed"
const DROP = "Fall Acceleration"

var player1Skill = JUMP
var player2Skill = JUMP

onready var player1 = get_node("HBoxContainer").get_child(0).get_child(1)
onready var player2 = get_node("HBoxContainer").get_child(1).get_child(1)

func _on_player1_button_up():
	match player1Skill:
		JUMP:
			player1Skill = DASH
		DASH:
			player1Skill = DROP
		DROP:
			player1Skill = JUMP
	player1.text = player1Skill


func _on_player2_button_up():
	match player2Skill:
		JUMP:
			player2Skill = DASH
		DASH:
			player2Skill = DROP
		DROP:
			player2Skill = JUMP
	player2.text = player2Skill

func _on_start_button_up():
	GameData.player3Skill = player1Skill
	GameData.player4Skill = player2Skill
	get_tree().change_scene("res://scenes/Scene2Joystick.tscn")
