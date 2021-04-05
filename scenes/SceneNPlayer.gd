extends Node2D

func _ready():
	if not GameData.isActiveP1:
		GameData.playerCount -= 1
		get_node("Player").queue_free()
	if not GameData.isActiveP2:
		GameData.playerCount -= 1
		get_node("Player2").queue_free()
	if not GameData.isActiveP3:
		GameData.playerCount -= 1
		get_node("Player3").queue_free()
	if not GameData.isActiveP4:
		GameData.playerCount -= 1
		get_node("Player4").queue_free()
