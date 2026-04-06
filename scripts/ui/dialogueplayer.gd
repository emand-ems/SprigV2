extends CanvasLayer

signal dialogue_finished

@export_file("*.json") var d_file

var dialogue = []
var current_dialogue_id = 0
var d_active = false

func _ready():
	$Box.visible = false

func start():
	if d_active:
		return
	d_active = true
	$Box.visible = true
	dialogue = load_dialogue()
	current_dialogue_id = -1
	next_script()

func load_dialogue():
	var file = FileAccess.open("res://assets/dialogue/mark_chat.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content

func _input(event):
	if !d_active:
		return
	if event.is_action_pressed("ui_accept"):
		next_script()

func next_script():
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogue):
		d_active = false
		$Box.visible = false
		emit_signal("dialogue_finished")
		return
	#Shows the given dialogue: incl the name and the message.
	$Box/Name.text = dialogue[current_dialogue_id]['name']
	$Box/Dialogue.text = dialogue[current_dialogue_id]['text']
