extends Button

export(String,FILE) var pathS := ""

func _on_button_up():
	print("ke sini")
	get_tree().change_scene(pathS)
