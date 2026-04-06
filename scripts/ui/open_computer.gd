extends Area2D
var near_computer = false
var computer_on = false
var player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("ui_accept") && near_computer && !computer_on):
		print("go!!!")
		computer_on = true
		player.stop_movement()
		$"../Menu".visible = true
	if (Input.is_action_just_pressed("ui_cancel") && near_computer && computer_on):
		print("STOP!!!")
		computer_on = false
		player.start_movement()
		$"../Menu".visible = false

func _on_body_entered(body: Node2D) -> void:
	near_computer = true
	print(near_computer)
	player = body

func _on_body_exited(body: Node2D) -> void:
	near_computer = false
	print(near_computer)
