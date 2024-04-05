extends CanvasLayer

var pause_menu
var ingame_ui

# Called when the node enters the scene tree for the first time.
func _ready():
	pause_menu = get_tree().get_nodes_in_group("pause_menu")
	ingame_ui = get_tree().get_nodes_in_group("game_ui")
	for i in len(pause_menu):
		var item = pause_menu[i]
		item.visible = false
	for i in len(ingame_ui):
		var item = ingame_ui[i]
		item.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_pause_button_pressed():
	$AnimationPlayer.play("start_pause")
	# pause game
	Global.pause()
	# remove in-game button add pause UI
	for i in len(ingame_ui):
		var item = ingame_ui[i]
		item.visible = false
	for i in len(pause_menu):
		var item = pause_menu[i]
		item.visible = true
	# retrieve variables from Global.gd
	$"UI Elements/Name".text = "Name: " + Global.PlayerName
	$"UI Elements/MaxHealth".text = "Max Health: " + str(Global.PlayerMaxHealth)
	$"UI Elements/CurrentHealth".text = "Current Health: " + str(Global.PlayerCurHealth)
	$"UI Elements/Attack".text = "Attack: " + str(Global.PlayerAttack)
	$"UI Elements/Defense".text = "Defense: " + str(Global.PlayerDefense)
	$"UI Elements/Level".text = "Level: " + str(Global.PlayerLvl)
	$"UI Elements/MaxExperience".text = "Max Experience: " + str(Global.PlayerMaxExperience)
	$"UI Elements/CurrentExperience".text = "Current Experience: " + str(Global.PlayerCurExperience)


func _on_unpause_button_pressed():
	# unpause game
	Global.unpause()
	# remove pause ui add in-game button
	for i in len(ingame_ui):
		var item = ingame_ui[i]
		item.visible = true
	for i in len(pause_menu):
		var item = pause_menu[i]
		item.visible = false


func _on_quit_to_menu_button_pressed():
	Global.unpause()
	Global.main_menu()


func _on_quit_to_desktop_button_pressed():
	Global.quit_game()
