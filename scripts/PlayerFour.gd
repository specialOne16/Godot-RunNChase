extends Player

func _ready():
	runner = preload("res://assets/runner orange.png")
	runnerSkillUsed = preload("res://assets/runner orange skillused.png")
	if not has_node("CatchedDetector"):
		get_node("Sprite").set_texture(runner)

func _physics_process(delta):
	
	myScore = GameData.scoreP4
	
	inputRight = Input.is_action_pressed("move_right_controller_two")
	inputLeft = Input.is_action_pressed("move_left_controller_two")
	inputJump = Input.is_action_just_pressed("jump_controller_two")

	match GameData.player4Skill:
		JUMP:
			jump(Input.is_action_just_pressed("skill_controller_two"))
		DASH:
			dash(Input.is_action_just_pressed("skill_controller_two"))
		DROP:
			drop(Input.is_action_just_pressed("skill_controller_two"))
			
	if not isChasing and notfreeze:
		GameData.scoreP4 += delta * SCORE_MULTIPLIER

	if not notfreeze:
		GameData.scoreP4 = 0
