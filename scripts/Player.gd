extends KinematicBody2D
class_name Player

var inputRight = false
var inputLeft = false
var inputJump = false
var notfreeze = true

var isChasing = true

var direction = 1
var velocity = Vector2.ZERO
var jumpCount = 0
var myScore = 0

var runner = preload("res://icon.png")
var chaser = preload("res://assets/chaser red.png")
var runnerSkillUsed = preload("res://icon.png")
var chaserSkillUsed = preload("res://assets/chaser skillused.png")
var isSkillUsed = false
var isSkillSoundPlayed = false

func _ready():
	isChasing = has_node("CatchedDetector")
	set_texture()

func set_texture():
	if isSkillUsed:
		if isChasing:
			get_node("Sprite").set_texture(chaserSkillUsed)
		else:
			get_node("Sprite").set_texture(runnerSkillUsed)
	else:
		if isChasing:
			get_node("Sprite").set_texture(chaser)
		else:
			get_node("Sprite").set_texture(runner)

const MAX_SPEED_X = 3000.0
const MAX_SPEED_FALL = 3000
const JUMP_FORCE = 1000
const SCORE_MULTIPLIER = 100

const ACCELERATION = 4000
const DECCELERATION = 3000
const GRAVITY = 2000
const MAX_JUMP_COUNT = 2
const FLOOR_NORMAL = Vector2.UP

const DROP_SPEED = 2500
const DROP = "Fall Acceleration"
func drop(input):
	if input and not isSkillUsed:
		velocity.y += DROP_SPEED
		isSkillUsed = true
		isSkillSoundPlayed = false
		set_texture()

const DASH_MULTIPLIER = 4000
const DASH = "Dashing Speed"
func dash(input):
	if input and not isSkillUsed:
		velocity.x += DASH_MULTIPLIER
		isSkillUsed = true
		isSkillSoundPlayed = false
		set_texture()

const JUMP = "Higher Jump"
func jump(input):
	if input and not isSkillUsed:
		velocity.y = -JUMP_FORCE * 2.5
		isSkillUsed = true
		isSkillSoundPlayed = false
		set_texture()
		
func scoreToSize(score):
	return (score as float) / GameData.playerCount / 1000 + 1.15
	
func _process(delta):
	var scaledVal = Vector2.ONE * clamp(scoreToSize(myScore),1.15,2.4)
	get_node(".").set_scale(scaledVal)


var isJump = false
func _physics_process(delta):
	
	var isRight = inputRight
	var isLeft = inputLeft
	var isStillJumping = velocity.y < -JUMP_FORCE* 2.0/3
	isJump = inputJump and jumpCount < MAX_JUMP_COUNT 
	
	if isRight:
		if direction==-1:
			velocity.x /= 3
		velocity.x += ACCELERATION * delta
	elif isLeft:
		if direction==1:
			velocity.x /= 3
		velocity.x += ACCELERATION * delta
	else:
		velocity.x -= DECCELERATION * delta
	
	if not isStillJumping:
		if isRight:
			direction = 1
		elif isLeft:
			direction = -1
		
	if isJump:
		get_node("AudioStreamPlayer").play()
		velocity.y = -JUMP_FORCE
		jumpCount += 1
	
	#if not inputJump and isStillJumping:
	#	velocity.y /= 2
		
	if isSkillUsed and not isSkillSoundPlayed:
		get_node("AudioStreamPlayer2").play()
		isSkillSoundPlayed = true
		
	if notfreeze:
		velocity.y += GRAVITY * delta
		velocity.y = clamp(velocity.y, -JUMP_FORCE*10, MAX_SPEED_FALL)
		velocity.x = clamp(velocity.x, 0, MAX_SPEED_X)
	else:
		velocity = Vector2.ZERO
	
	velocity.y = move_and_slide(Vector2(velocity.x * direction,velocity.y), FLOOR_NORMAL).y
	
	if is_on_ceiling():
		velocity.y = 0
	
	if is_on_wall():
		jumpCount = 1
		velocity.x = clamp(velocity.x, 0, MAX_SPEED_X/4)
		if isJump:
			jumpCount = 2
			direction = -direction
	
	if is_on_floor():
		velocity.y = 0
		jumpCount = 0
		isSkillUsed = false
		set_texture()
		
