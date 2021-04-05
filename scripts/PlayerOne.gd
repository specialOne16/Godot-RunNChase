extends Player

func _ready():
	runner = preload("res://assets/runner blue.png")
	runnerSkillUsed = preload("res://assets/runner blue skillused.png")
	if not has_node("CatchedDetector"):
		get_node("Sprite").set_texture(runner)

func _physics_process(delta):
	
	myScore = GameData.scoreP1
	
	inputRight = Input.is_action_pressed("move_right_one")
	inputLeft = Input.is_action_pressed("move_left_one")
	inputJump = Input.is_action_just_pressed("jump_one")
	
	match GameData.player1Skill:
		JUMP:
			jump(Input.is_action_just_pressed("skill_one"))
		DASH:
			dash(Input.is_action_just_pressed("skill_one"))
		DROP:
			drop(Input.is_action_just_pressed("skill_one"))
	
	if not isChasing and notfreeze:
		GameData.scoreP1 += delta * SCORE_MULTIPLIER
	
	if not notfreeze:
		GameData.scoreP1 = 0

