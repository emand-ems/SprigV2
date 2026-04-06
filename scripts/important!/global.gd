extends Node

var current_scene = "res://scenes/world.tscn"
var transition_scene = false
var next_scene = "res://scenes/valley.tscn"

var player_exit_valley_posx = 275
var player_exit_valley_posy = 150
var player_pos = Vector2(87, 150)
var player_direction = "right"
var camera
var x_camera
var y_camera
var right_limit = 288
var bottom_limit = 176

var near_door = false
var enter_touched = false

var game_first_loadin = true

func _ready():
	pass

func register_camera(camera_put):
	camera = camera_put
	print(camera)

func finish_changescene():
	if transition_scene == true:
		print("in global")
		transition_scene = false
		Global.near_door = false
		get_tree().change_scene_to_file(next_scene)
		current_scene = next_scene
		game_first_loadin = false
		print("here!")

func current_camera(right, bottom):
	right_limit = right
	bottom_limit = bottom
	x_camera = 0
	y_camera = 0
	camera.offset = Vector2(0, 0)
	print(camera.position)

func ready_camera():
	camera.offset = Vector2(0, 0)
	camera.position = Vector2(100, 900)
