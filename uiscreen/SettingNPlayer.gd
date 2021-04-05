extends Control

const JUMP = "Higher Jump"
const DASH = "Dashing Speed"
const DROP = "Fall Acceleration"
const NOPLAY = "Not Playing"

var player1Skill = JUMP
var player2Skill = JUMP
var player3Skill = JUMP
var player4Skill = JUMP

onready var player1 = get_node("VBoxContainer/HBoxContainer/VBoxContainer/Button")
onready var player2 = get_node("VBoxContainer/HBoxContainer/VBoxContainer2/Button")
onready var player3 = get_node("VBoxContainer/HBoxContainer2/VBoxContainer3/Button")
onready var player4 = get_node("VBoxContainer/HBoxContainer2/VBoxContainer4/Button")

func _ready():
	GameData.isActiveP1 = true
	GameData.isActiveP2 = true
	GameData.isActiveP3 = true
	GameData.isActiveP4 = true
	player1.text = player1Skill
	player2.text = player2Skill
	player3.text = player3Skill
	player4.text = player4Skill

func _on_start_button_up():
	GameData.player1Skill = player1Skill
	GameData.player2Skill = player2Skill
	GameData.player3Skill = player3Skill
	GameData.player4Skill = player4Skill
	get_tree().change_scene("res://scenes/SceneNPlayer.tscn")

func _on_Player1_button_up():
	match player1Skill:
		JUMP:
			player1Skill = DASH
		DASH:
			player1Skill = DROP
		DROP:
			player1Skill = NOPLAY
			GameData.isActiveP1 = false
		NOPLAY:
			GameData.isActiveP1 = true
			player1Skill = DASH
	player1.text = player1Skill


func _on_Player2_button_up():
	match player2Skill:
		JUMP:
			player2Skill = DASH
		DASH:
			player2Skill = DROP
		DROP:
			player2Skill = NOPLAY
			GameData.isActiveP2 = false
		NOPLAY:
			GameData.isActiveP2 = true
			player2Skill = DASH
	player2.text = player2Skill


func _on_Player3_button_up():
	match player3Skill:
		JUMP:
			player3Skill = DASH
		DASH:
			player3Skill = DROP
		DROP:
			player3Skill = NOPLAY
			GameData.isActiveP3 = false
		NOPLAY:
			GameData.isActiveP3 = true
			player3Skill = DASH
	player3.text = player3Skill


func _on_Player4_button_up():
	match player4Skill:
		JUMP:
			player4Skill = DASH
		DASH:
			player4Skill = DROP
		DROP:
			player4Skill = NOPLAY
			GameData.isActiveP4 = false
		NOPLAY:
			GameData.isActiveP4 = true
			player4Skill = DASH
	player4.text = player4Skill
