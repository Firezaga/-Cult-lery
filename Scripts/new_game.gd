extends Node2D

var text
var cutscene_playing
var can_skip

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "FALLING           \nF A L L L I N G                 \nF  A  L  L  I  N  G                \nF   A   L   L   I   N   G                    \nF    A    L    L    I    N    G                  \nF     A     L     L     I     N     G                   ~F      A      L      L      I      N      G                  \nF          A          L          L          I          N          G                               \nF                  A                   L                    L                                                       ~Pain...                                                                                                                                                               \n\n\n\n\nPlease, try and remember your name, the world needs your help."
	cutscene_playing = true
	can_skip = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("skip_cutscene") && cutscene_playing:
		$OpeningCutscene.stop()
		cutscene_playing = false
		$SkipTimer.start()
		_on_opening_cutscene_finished()


func _on_player_name_text_input_text_submitted(_name):
	Global.PlayerName = _name
	$EndOpeningCutscene.visible = true
	$EndOpeningCutscene.play()
	$DizzyLoop.visible = false
	$PlayerNameTextInput.visible = false
	$TextBackground.visible = false
	$DizzyLoop.stop()


func _on_skip_timer_timeout():
	can_skip = true


func _on_opening_cutscene_finished():
	cutscene_playing = false
	$OpeningCutscene.visible = false
	$DizzyLoop.visible = true
	$DizzyLoop.play()
	$TextBackground.visible = true
	for i in len(text):
		if text[i] == '~':
			await get_tree().create_timer(1).timeout
			$TextBackground/Label.text = ""
			continue
		if Input.is_action_pressed("skip_cutscene") && can_skip:
			can_skip = false
			$TextBackground/Label.text = text
			$SkipTimer.start()
			break
		$TextBackground/Label.text += text[i]
		await get_tree().create_timer(0.01).timeout
	$PlayerNameTextInput.visible = true


func _on_end_opening_cutscene_finished():
	Global.goto_village_deserted()
