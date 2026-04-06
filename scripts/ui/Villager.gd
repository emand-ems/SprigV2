extends CharacterBody2D

var player_in_chat_zone = false
var chatting = false
var timer = 0
var player

func _physics_process(delta):
	$"Villager Sprite".play("blink")

func _process(delta):
	if (player_in_chat_zone):
		if (Input.is_action_just_pressed("ui_accept") && player.can_talk == true):
			player.stop_movement()
			$Textbox.start()


func _on_villager_conversation_body_entered(body):
	if body.has_method("player"):
		player = body
		player_in_chat_zone = true


func _on_villager_conversation_body_exited(body):
	if body.has_method("player"):
		player_in_chat_zone = false


func _on_textbox_dialogue_finished():
	player.start_movement()
	chatting = false 
