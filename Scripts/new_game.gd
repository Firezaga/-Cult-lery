extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("skip_cutscene"):
		$OpeningCutscene.visible = false
		$PlayerNameTextInput.visible = true


func _on_video_stream_player_finished():
	$OpeningCutscene.visible = false
	$PlayerNameTextInput.visible = true


func _on_player_name_text_input_text_submitted(_name):
	Global.PlayerName = _name
	Global.goto_village_deserted()
