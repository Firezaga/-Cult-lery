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
	$PlayerStats/Name.text = Global.PlayerName
	$PlayerStats/Lvl.text = str(Global.PlayerLvl)
	$PlayerStats/Lvl2.text = str(Global.PlayerLvl + 1)
	$PlayerStats/LevelProgressBar.max_value = Global.PlayerMaxExperience
	$PlayerStats/LevelProgressBar.value = Global.PlayerCurExperience
	$PlayerStats/HealthBar.max_value = Global.PlayerMaxHealth
	$PlayerStats/HealthBar.value = Global.PlayerCurHealth
	if Global.PlayerWeapon1 != "":
		$PlayerStats/Weapon1.texture = ResourceLoader.load(Global.PlayerWeapon1)
	if Global.PlayerWeapon2 != "":
		$PlayerStats/Weapon2.texture = ResourceLoader.load(Global.PlayerWeapon2)
	if Global.PlayerWeapon3 != "":
		$PlayerStats/Weapon3.texture = ResourceLoader.load(Global.PlayerWeapon3)
	if Global.PlayerWeapon4 != "":
		$PlayerStats/Weapon4.texture = ResourceLoader.load(Global.PlayerWeapon4)
	# pause game
	Global.pause()
	# remove in-game button add pause UI
	for i in len(ingame_ui):
		var item = ingame_ui[i]
		item.visible = false
	for i in len(pause_menu):
		var item = pause_menu[i]
		item.visible = true


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
