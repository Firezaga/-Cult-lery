extends CanvasLayer

var raw_text
var can_skip = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect/AnimationPlayer.play("background_in")
	if Global.DiaSpriteRight != "":
		$SpriteRight.texture = ResourceLoader.load(Global.DiaSpriteRight)
	if Global.DiaSpriteLeft != "":
		$SpriteLeft.texture = ResourceLoader.load(Global.DiaSpriteLeft)
	$SceneBackground.texture = ResourceLoader.load(Global.DiaBackground)
	raw_text = Global.DiaText

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	$ColorRect.visible = false
	$ColorRect2.visible = true
	
	$SpriteRight.visible = true
	$SpriteLeft.visible = true
	$TextBackground.visible = true
	$SceneBackground.visible = true
	$AnimationPlayer2.play("ui_in")


func _on_animation_player_2_animation_finished(anim_name):
	can_skip = true
	await ProText()
	Global.PlayerMove = true
	queue_free()


#Process text
func ProText():
	var text_to_send = ""
	for i in len(raw_text):
		if raw_text[i] == '~':
			await DisplayText(text_to_send)
			await get_tree().create_timer(2.0).timeout
			text_to_send = ""
			continue
		text_to_send += raw_text[i]


func DisplayText(text):
	$TextBackground/Label.text = ""
	for i in len(text):
		if Input.is_action_pressed("skip_cutscene") && can_skip:
			can_skip = false
			$TextBackground/Label.text = text
			$DiaTimer.start()
			break
		$TextBackground/Label.text += text[i]
		await get_tree().create_timer(0.01).timeout


func _on_dia_timer_timeout():
	can_skip = true
