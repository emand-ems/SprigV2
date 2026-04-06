extends Exit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	door_change_scene("res://scenes/sunhouse.tscn", 480, 256, 120, 204, "up")



func _on_body_entered(body):
	if (body.has_method("player")):
		Global.near_door = true

func _on_body_exited(body):
	if (body.has_method("player")):
		Global.near_door = false
