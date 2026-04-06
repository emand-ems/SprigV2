class_name Exit extends Node
 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func inside_change_scene(next, cam_x, cam_y, pos_x, pos_y, direction):
	Global.next_scene = next
	Global.current_camera(cam_x, cam_y)
	Global.transition_scene = true
	Global.player_pos = Vector2(pos_x, pos_y)
	Global.player_direction = direction

func door_change_scene(next, cam_x, cam_y, pos_x, pos_y, direction):
	if (Input.is_action_just_pressed("ui_accept") && Global.near_door):
		inside_change_scene(next, cam_x, cam_y, pos_x, pos_y, direction)
