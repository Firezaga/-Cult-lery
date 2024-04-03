extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("skip_cutscene"):
		$VideoStreamPlayer.stop()
		Global.goto_village_deserted()



func _on_video_stream_player_finished():
	Global.goto_village_deserted()
