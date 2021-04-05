extends Player

func _ready():
	runner = preload("res://assets/runner yellow.png")
	runnerSkillUsed = preload("res://assets/runner yellow skillused.png")
	if not has_node("CatchedDetector"):
		get_node("Sprite").set_texture(runner)

func _physics_process(delta):
	
	myScore = GameData.scoreP3
	
	inputRight = Input.is_action_pressed("move_right_controller_one")
	inputLeft = Input.is_action_pressed("move_left_controller_one")
	inputJump = Input.is_action_just_pressed("jump_controller_one")

	match GameData.player3Skill:
		JUMP:
			jump(Input.is_action_just_pressed("skill_controller_one"))
		DASH:
			dash(Input.is_action_just_pressed("skill_controller_one"))
		DROP:
			drop(Input.is_action_just_pressed("skill_controller_one"))

	if not isChasing and notfreeze:
		GameData.scoreP3 += delta * SCORE_MULTIPLIER

	if not notfreeze:
		GameData.scoreP3 = 0
