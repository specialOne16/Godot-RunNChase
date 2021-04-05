extends Area2D

var henshin = true

var runnerImg
var chaserImg
	
func _ready():
	chaserImg = get_parent().chaser
	henshin = false
	get_parent().get_node("Sprite").set_texture(chaserImg)

func _on_catched(runner:Player):
	runnerImg = get_parent().runner
	var thisPlayer := get_parent()
	if(runner != thisPlayer && !henshin):
		henshin = true
		get_node("AudioStreamPlayer").play()
		runner.notfreeze = false
		thisPlayer.get_node("Sprite").set_texture(runnerImg)
		thisPlayer.isChasing = false
		var anim = runner.get_node("AnimationPlayer")
		anim.play("Shrink")
		yield(anim,"animation_finished")
		runner.isChasing = true
		runner.add_child(load("res://prefabs/CatchedDetector.tscn").instance())
		anim.play("Grow")
		yield(anim,"animation_finished")
		runner.notfreeze = true
		thisPlayer.remove_child(get_node("."))
