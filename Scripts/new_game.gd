extends Node2D

var text
var cutscene_playing
var can_skip

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pellentesque justo nec odio ultrices, vitae tincidunt nibh mollis. Nulla facilisi. Suspendisse potenti. Vivamus auctor nisl vel nunc mattis, eu sodales nibh molestie. Praesent nec nisl nec nunc volutpat mollis. Sed quis nunc nec nunc mattis molestie. Sed auctor nisl nec nunc mattis, eu sodales nibh molestie. Vivamus auctor nisl vel nunc mattis, eu sodales nibh molestie. Praesent nec nisl nec nunc volutpat mollis. Sed quis nunc nec nunc mattis molestie. Sed auctor nisl nec nunc mattis, eu sodales nibh molestie."
	cutscene_playing = true
	can_skip = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("skip_cutscene") && cutscene_playing:
		$OpeningCutscene.stop()
		cutscene_playing = false
		$SkipTimer.start()
		_on_video_stream_player_finished()
	

func _on_video_stream_player_finished():
	cutscene_playing = false
	$OpeningCutscene.visible = false
	$TextBackground.visible = true
	for i in len(text):
		if Input.is_action_pressed("skip_cutscene") && can_skip:
			can_skip = false
			$TextBackground/Label.text = text
			$SkipTimer.start()
			break
		$TextBackground/Label.text += text[i]
		await get_tree().create_timer(0.01).timeout
	$PlayerNameTextInput.visible = true


func _on_player_name_text_input_text_submitted(_name):
	Global.PlayerName = _name
	Global.goto_village_deserted()


func _on_skip_timer_timeout():
	can_skip = true
