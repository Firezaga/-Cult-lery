extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$shop_ui.visible = false
	$shop_ui/PlayerCoins.text = str(Global.PlayerMoney)
	$shop_ui/PlayerPotions.text = str(Global.PlayerPotion)
	$ColorRect/AnimationPlayer.play("background_in")
	Global.PlayerMove = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_potion_button_button_down():
	if Global.PlayerMoney < 5:
		return
	Global.PlayerMoney -= 5
	Global.PlayerPotion += 1
	$shop_ui/PlayerCoins.text = str(Global.PlayerMoney)
	$shop_ui/PlayerPotions.text = str(Global.PlayerPotion)


func _on_animation_player_animation_finished(anim_name):
	$ColorRect.visible = false
	$ColorRect2.visible = true
	$shop_ui.visible = true
	$AnimationPlayer2.play("ui_in")


func _on_animation_player_2_animation_finished(anim_name):
	$ColorRect2.visible = false


func _on_back_button_button_down():
	Global.PlayerMove = true
	queue_free()
