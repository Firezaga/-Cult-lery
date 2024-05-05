extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property($AudioStreamPlayer, "volume_db", 0, 3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	pass


func _on_new_game_button_pressed():
	Global.new_game()


func _on_continue_game_button_pressed():
	pass # Replace with function body.


func _on_load_game_button_pressed():
	pass # Replace with function body.


func _on_settings_button_pressed():
	Global.settings()


func _on_quit_button_pressed():
	Global.quit_game()



func _on_audio_stream_player_finished():
	$AudioStreamPlayer.playing = true
