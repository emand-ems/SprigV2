extends CharacterBody2D
class_name Player

const speed = 100
var current_direction = "none"
var can_move = true
var can_talk = true

func _ready():
	Global.register_camera($player_camera)
	$player_camera.limit_right = Global.right_limit
	$player_camera.limit_bottom = Global.bottom_limit
	position = Global.player_pos
	Global.near_door = false
	change_direction(Global.player_direction)

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	if (can_move):
		if Input.is_action_pressed("ui_right"):
			current_direction = "right"
			play_anim(1)
			velocity.x = speed
			velocity.y = 0
		elif Input.is_action_pressed("ui_left"):
			current_direction = "left"
			play_anim(1)
			velocity.x = -speed
			velocity.y = 0
		elif Input.is_action_pressed("ui_down"):
			current_direction = "down"
			play_anim(1)
			velocity.x = 0
			velocity.y = speed
		elif Input.is_action_pressed("ui_up"):
			current_direction = "up"
			play_anim(1)
			velocity.x = 0
			velocity.y = -speed
		else:
			play_anim(0)
			velocity.x = 0
			velocity.y = 0

	move_and_slide()

func play_anim(movement):
	var direction = current_direction
	var anim = $AnimatedSprite2D

	if direction == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	if direction == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	if direction == "down":
		anim.flip_h = true
		if movement == 1:
			anim.play("front_walk")
		elif movement == 0:
			anim.play("idle")
	if direction == "up":
		anim.flip_h = true
		if movement == 1:
			anim.play("back_walk")
		elif movement == 0:
			anim.play("back_idle")

func change_direction(direction):
	var anim = $AnimatedSprite2D
	print("direc")

	if direction == "right":
			anim.play("side_idle")
	if direction == "left":
		anim.flip_h = true
		anim.play("side_idle")
	if direction == "down":
		anim.flip_h = true
		anim.play("idle")
	if direction == "up":
		anim.flip_h = true
		anim.play("back_idle")

func player():
	print("player")

func stop_movement():
	can_move = false

func start_movement():
	can_move = true
	can_talk = false
	$Timer.start()

func _on_timer_timeout():
	can_talk = true
