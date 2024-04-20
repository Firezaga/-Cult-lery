extends CanvasLayer

var battle_start
var battle
var buttons_w_back
var buttons
var battle_text

var player_health_bar
var enemy1_health_bar
var enemy2_health_bar
var enemy3_health_bar
var enemy4_health_bar
var enemy1_disabled = true
var enemy2_disabled = true
var enemy3_disabled = true
var enemy4_disabled = true
var enemies_remaining

var current_weapon = 1
var max_weapons


# Called when the node enters the scene tree for the first time.
func _ready():
	battle_start = get_tree().get_nodes_in_group("BattleStart")
	battle = get_tree().get_nodes_in_group("Battle")
	buttons_w_back = get_tree().get_nodes_in_group("ButtonsWBack")
	buttons = get_tree().get_nodes_in_group("Buttons")
	battle_text = get_node("UI/Buttons/ButtonBackground/BattleText")
	player_health_bar = get_node("UI/Player/PlayerHealth")
	enemy1_health_bar = get_node("UI/Enemy/Enemy1Health")
	enemy2_health_bar = get_node("UI/Enemy/Enemy2Health")
	enemy3_health_bar = get_node("UI/Enemy/Enemy3Health")
	enemy4_health_bar = get_node("UI/Enemy/Enemy4Health")
	
	for i in len(battle_start):
		var j = battle_start[i]
		j.visible = true
	for i in len(battle):
		var j = battle[i]
		j.visible = false
	battle_text.text = ""
	$BattleStart/AnimationPlayer.play("battle_start")
	
	print("Enemy processing")
	if !(Global.EnemyNumberOf == 1 || 2 || 3 || 4):
		print("Number of enemies = " + str(Global.EnemyNumberOf))
		Global.quit_game()
	if Global.EnemyNumberOf == 1:
		battle_text.text = Global.Enemy1Name
		$Enemy/Enemy1.texture = ResourceLoader.load(Global.Enemy1)
		enemy1_health_bar.max_value = Global.Enemy1Health
		enemy1_health_bar.value = Global.Enemy1Health
		enemy1_disabled = false
		enemies_remaining = 1
	if Global.EnemyNumberOf == 2:
		battle_text.text = Global.Enemy1Name
		$Enemy/Enemy1.texture = ResourceLoader.load(Global.Enemy1)
		enemy1_health_bar.max_value = Global.Enemy1Health
		enemy1_health_bar.value = Global.Enemy1Health
		enemy1_disabled = false
		battle_text.text += " " + Global.Enemy2Name
		$Enemy/Enemy2.texture = ResourceLoader.load(Global.Enemy2)
		enemy2_health_bar.max_value = Global.Enemy2Health
		enemy2_health_bar.value = Global.Enemy2Health
		enemy2_disabled = false
		enemies_remaining = 2
		$UI/Buttons/TargetButtons/AttackEnemy1Button.position = Vector2(918, 800)
		$UI/Buttons/TargetButtons/AttackEnemy2Button.position = Vector2(1415, 800)
		$UI/Buttons/TargetButtons/AttackEnemy1Button.visible = true
		$UI/Buttons/TargetButtons/AttackEnemy2Button.visible = true
	if Global.EnemyNumberOf == 3:
		battle_text.text = Global.Enemy1Name
		$Enemy/Enemy1.texture = ResourceLoader.load(Global.Enemy1)
		enemy1_health_bar.max_value = Global.Enemy1Health
		enemy1_health_bar.value = Global.Enemy1Health
		enemy1_disabled = false
		battle_text.text += " " + Global.Enemy2Name
		$Enemy/Enemy2.texture = ResourceLoader.load(Global.Enemy2)
		enemy2_health_bar.max_value = Global.Enemy2Health
		enemy2_health_bar.value = Global.Enemy2Health
		enemy2_disabled = false
		battle_text.text += " " + Global.Enemy3Name
		$Enemy/Enemy3.texture = ResourceLoader.load(Global.Enemy3)
		enemy3_health_bar.max_value = Global.Enemy3Health
		enemy3_health_bar.value = Global.Enemy3Health
		enemy3_disabled = false
		enemies_remaining = 3
		$UI/Buttons/TargetButtons/AttackEnemy1Button.position = Vector2(918, 835)
		$UI/Buttons/TargetButtons/AttackEnemy2Button.position = Vector2(1415, 835)
		$UI/Buttons/TargetButtons/AttackEnemy3Button.position = Vector2(1166, 706)
		$UI/Buttons/TargetButtons/AttackEnemy1Button.visible = true
		$UI/Buttons/TargetButtons/AttackEnemy2Button.visible = true
		$UI/Buttons/TargetButtons/AttackEnemy3Button.visible = true
	if Global.EnemyNumberOf == 4:
		battle_text.text = Global.Enemy1Name
		$Enemy/Enemy1.texture = ResourceLoader.load(Global.Enemy1)
		enemy1_health_bar.max_value = Global.Enemy1Health
		enemy1_health_bar.value = Global.Enemy1Health
		enemy1_disabled = false
		battle_text.text += " " + Global.Enemy2Name
		$Enemy/Enemy2.texture = ResourceLoader.load(Global.Enemy2)
		enemy2_health_bar.max_value = Global.Enemy2Health
		enemy2_health_bar.value = Global.Enemy2Health
		enemy2_disabled = false
		battle_text.text += " " + Global.Enemy3Name
		$Enemy/Enemy3.texture = ResourceLoader.load(Global.Enemy3)
		enemy3_health_bar.max_value = Global.Enemy3Health
		enemy3_health_bar.value = Global.Enemy3Health
		enemy3_disabled = false
		battle_text.text += " " + Global.Enemy4Name
		$Enemy/Enemy4.texture = ResourceLoader.load(Global.Enemy4)
		enemy4_health_bar.max_value = Global.Enemy4Health
		enemy4_health_bar.value = Global.Enemy4Health
		enemy4_disabled = false
		enemies_remaining = 4
		$UI/Buttons/TargetButtons/AttackEnemy1Button.position = Vector2(918, 835)
		$UI/Buttons/TargetButtons/AttackEnemy2Button.position = Vector2(1415, 835)
		$UI/Buttons/TargetButtons/AttackEnemy3Button.position = Vector2(918, 706)
		$UI/Buttons/TargetButtons/AttackEnemy4Button.position = Vector2(1415, 706)
		$UI/Buttons/TargetButtons/AttackEnemy1Button.visible = true
		$UI/Buttons/TargetButtons/AttackEnemy2Button.visible = true
		$UI/Buttons/TargetButtons/AttackEnemy3Button.visible = true
		$UI/Buttons/TargetButtons/AttackEnemy4Button.visible = true
	
	if Global.PlayerWeapon1 != "":
		$Player/Weapon1.texture = ResourceLoader.load(Global.PlayerWeapon1)
		max_weapons = 1
	if Global.PlayerWeapon2 != "":
		$Player/Weapon2.texture = ResourceLoader.load(Global.PlayerWeapon2)
		max_weapons = 2
	if Global.PlayerWeapon3 != "":
		$Player/Weapon3.texture = ResourceLoader.load(Global.PlayerWeapon3)
		max_weapons = 3
	if Global.PlayerWeapon4 != "":
		$Player/Weapon4.texture = ResourceLoader.load(Global.PlayerWeapon4)
		max_weapons = 4
	
	player_health_bar.max_value = Global.PlayerMaxHealth
	player_health_bar.value = Global.PlayerCurHealth
	enemy1_health_bar.max_value = Global.Enemy1Health
	enemy1_health_bar.value = Global.Enemy1Health
	await get_tree().create_timer(5.0).timeout


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func DisplayText(text):
	battle_text.text = ""
	battle_text.visible = true
	for i in len(text):
		battle_text.text += text[i]
		await get_tree().create_timer(0.02).timeout
	await get_tree().create_timer(2.0).timeout
	battle_text.visible = false


func DamageToPlayer(amount):
	var damage = amount - Global.PlayerDefense
	if damage < 0:
		damage = 0
	
	Global.PlayerCurHealth -= damage
	var tween = get_tree().create_tween()
	tween.tween_property(player_health_bar, "value", Global.PlayerCurHealth, 0.5)
	await DisplayText(str(damage) + " points of damage recieved.")
	if Global.PlayerCurHealth < 1:
		Global.game_over()


func DamageToEnemy1(amount):
	var damage = amount - Global.Enemy1Defense
	if damage < 0:
		damage = 0
	Global.Enemy1Health -= damage
	var tween = get_tree().create_tween()
	tween.tween_property(enemy1_health_bar, "value", Global.Enemy1Health, 0.5)
	tween.tween_property($UI/Player/AP, "value", $UI/Player/AP.value + 25, 0.5)
	await DisplayText(str(damage) + " points of damage dealt to " + Global.Enemy1Name)
	if enemy1_health_bar.value < 1:
		$UI/Enemy/Enemy1Health.visible = false
		$Enemy/Enemy1.visible = false
		enemy1_disabled = true
		$UI/Buttons/TargetButtons/AttackEnemy1Button.disabled = true
		enemies_remaining -= 1
	EnemyTurn()


func DamageToEnemy2(amount):
	var damage = amount - Global.Enemy2Defense
	if damage < 0:
		damage = 0
	Global.Enemy2Health -= damage
	var tween = get_tree().create_tween()
	tween.tween_property(enemy2_health_bar, "value", Global.Enemy2Health, 0.5)
	tween.tween_property($UI/Player/AP, "value", $UI/Player/AP.value + 25, 0.5)
	await DisplayText(str(damage) + " points of damage dealt to " + Global.Enemy2Name)
	if enemy2_health_bar.value < 1:
		$UI/Enemy/Enemy2Health.visible = false
		$Enemy/Enemy2.visible = false
		enemy2_disabled = true
		$UI/Buttons/TargetButtons/AttackEnemy2Button.disabled = true
		enemies_remaining -= 1
	EnemyTurn()


func DamageToEnemy3(amount):
	var damage = amount - Global.Enemy3Defense
	if damage < 0:
		damage = 0
	Global.Enemy3Health -= damage
	var tween = get_tree().create_tween()
	tween.tween_property(enemy3_health_bar, "value", Global.Enemy3Health, 0.5)
	tween.tween_property($UI/Player/AP, "value", $UI/Player/AP.value + 25, 0.5)
	await DisplayText(str(damage) + " points of damage dealt to " + Global.Enemy3Name)
	if enemy3_health_bar.value < 1:
		$UI/Enemy/Enemy3Health.visible = false
		$Enemy/Enemy3.visible = false
		enemy3_disabled = true
		$UI/Buttons/TargetButtons/AttackEnemy3Button.disabled = true
		enemies_remaining -= 1
	EnemyTurn()


func DamageToEnemy4(amount):
	var damage = amount - Global.Enemy4Defense
	if damage < 0:
		damage = 0
	Global.Enemy4Health -= damage
	var tween = get_tree().create_tween()
	tween.tween_property(enemy4_health_bar, "value", Global.Enemy4Health, 0.5)
	tween.tween_property($UI/Player/AP, "value", $UI/Player/AP.value + 25, 0.5)
	await DisplayText(str(damage) + " points of damage dealt to " + Global.Enemy4Name)
	if enemy4_health_bar.value < 1:
		$UI/Enemy/Enemy4Health.visible = false
		$Enemy/Enemy4.visible = false
		enemy4_disabled = true
		$UI/Buttons/TargetButtons/AttackEnemy4Button.disabled = true
		enemies_remaining -= 1
	EnemyTurn()


func PlayerTurn():
	battle_text.visible = false
	for i in len(buttons):
		var j = buttons[i]
		j.visible = true


func Victory():
	var experience = 5 # TO DO
	Global.PlayerCurExperience += experience
	Global.PlayerMove = true
	Global.battle_end()
	queue_free()


func _on_attack_button_pressed():
	for i in len(buttons):
		var j = buttons[i]
		j.visible = false
	if Global.EnemyNumberOf == 1:
		await DisplayText("You attack.")
		await DamageToEnemy1(Global.PlayerAttack)
		return
	$UI/Buttons/TargetButtons.visible = true


func _on_defend_button_pressed():
	for i in len(buttons):
		var j = buttons[i]
		j.visible = false
	await DisplayText("You defend.")
	EnemyTurn()


func _on_wait_button_pressed():
	for i in len(buttons):
		var j = buttons[i]
		j.visible = false
	await DisplayText("You wait.")
	EnemyTurn()


func _on_flee_button_pressed():
	for i in len(buttons):
		var j = buttons[i]
		j.visible = false
	await DisplayText("You attempt to flee.")
	EnemyTurn()


func EnemyTurn():
	if enemies_remaining == 0:
		Victory()
		queue_free()
	if Global.EnemyNumberOf == 1:
		await DisplayText(Global.Enemy1Name + "'s turn.")
		await DisplayText(Global.Enemy1Name + " attacks.")
		await DamageToPlayer(Global.Enemy1Attack)
		var tween = get_tree().create_tween()
		tween.tween_property(player_health_bar, "value", Global.PlayerCurHealth, 1)
	elif Global.EnemyNumberOf == 2:
		if !enemy1_disabled:
			await DisplayText(Global.Enemy1Name + "'s turn.")
			await DisplayText(Global.Enemy1Name + " attacks.")
			await DamageToPlayer(Global.Enemy1Attack)
			var tween = get_tree().create_tween()
			tween.tween_property(player_health_bar, "value", Global.PlayerCurHealth, 1)
		if !enemy2_disabled:
			await DisplayText(Global.Enemy2Name + "'s turn.")
			await DisplayText(Global.Enemy2Name + " attacks.")
			await DamageToPlayer(Global.Enemy2Attack)
			var tween = get_tree().create_tween()
			tween.tween_property(player_health_bar, "value", Global.PlayerCurHealth, 1)
	elif Global.EnemyNumberOf == 3:
		if !enemy1_disabled:
			await DisplayText(Global.Enemy1Name + "'s turn.")
			await DisplayText(Global.Enemy1Name + " attacks.")
			await DamageToPlayer(Global.Enemy1Attack)
			var tween = get_tree().create_tween()
			tween.tween_property(player_health_bar, "value", Global.PlayerCurHealth, 1)
		if !enemy2_disabled:
			await DisplayText(Global.Enemy2Name + "'s turn.")
			await DisplayText(Global.Enemy2Name + " attacks.")
			await DamageToPlayer(Global.Enemy2Attack)
			var tween = get_tree().create_tween()
			tween.tween_property(player_health_bar, "value", Global.PlayerCurHealth, 1)
		if !enemy3_disabled:
			await DisplayText(Global.Enemy3Name + "'s turn.")
			await DisplayText(Global.Enemy3Name + " attacks.")
			await DamageToPlayer(Global.Enemy3Attack)
			var tween = get_tree().create_tween()
			tween.tween_property(player_health_bar, "value", Global.PlayerCurHealth, 1)
	elif Global.EnemyNumberOf == 4:
		if !enemy1_disabled:
			await DisplayText(Global.Enemy1Name + "'s turn.")
			await DisplayText(Global.Enemy1Name + " attacks.")
			await DamageToPlayer(Global.Enemy1Attack)
			var tween = get_tree().create_tween()
			tween.tween_property(player_health_bar, "value", Global.PlayerCurHealth, 1)
		if !enemy2_disabled:
			await DisplayText(Global.Enemy2Name + "'s turn.")
			await DisplayText(Global.Enemy2Name + " attacks.")
			await DamageToPlayer(Global.Enemy2Attack)
			var tween = get_tree().create_tween()
			tween.tween_property(player_health_bar, "value", Global.PlayerCurHealth, 1)
		if !enemy3_disabled:
			await DisplayText(Global.Enemy3Name + "'s turn.")
			await DisplayText(Global.Enemy3Name + " attacks.")
			await DamageToPlayer(Global.Enemy3Attack)
			var tween = get_tree().create_tween()
			tween.tween_property(player_health_bar, "value", Global.PlayerCurHealth, 1)
		if !enemy4_disabled:
			await DisplayText(Global.Enemy4Name + "'s turn.")
			await DisplayText(Global.Enemy4Name + " attacks.")
			await DamageToPlayer(Global.Enemy3Attack)
			var tween = get_tree().create_tween()
			tween.tween_property(player_health_bar, "value", Global.PlayerCurHealth, 1)
	PlayerTurn()


func _on_animation_player_animation_finished(anim_name):
	for i in len(battle_start):
		var j = battle_start[i]
		j.visible = false
	for i in len(battle):
		var j = battle[i]
		j.visible = true
	if Global.EnemyNumberOf == 1:
		$UI/Enemy/Enemy1Health.visible = true
		$Enemy/Enemy1.visible = true
	if Global.EnemyNumberOf == 2:
		$UI/Enemy/Enemy1Health.visible = true
		$Enemy/Enemy1.visible = true
		$UI/Enemy/Enemy2Health.visible = true
		$Enemy/Enemy2.visible = true
	if Global.EnemyNumberOf == 3:
		$UI/Enemy/Enemy1Health.visible = true
		$Enemy/Enemy1.visible = true
		$UI/Enemy/Enemy2Health.visible = true
		$Enemy/Enemy2.visible = true
		$UI/Enemy/Enemy3Health.visible = true
		$Enemy/Enemy3.visible = true
	if Global.EnemyNumberOf == 4:
		$UI/Enemy/Enemy1Health.visible = true
		$Enemy/Enemy1.visible = true
		$UI/Enemy/Enemy2Health.visible = true
		$Enemy/Enemy2.visible = true
		$UI/Enemy/Enemy3Health.visible = true
		$Enemy/Enemy3.visible = true
		$UI/Enemy/Enemy4Health.visible = true
		$Enemy/Enemy4.visible = true
	if Global.PlayerAP == 1:
		var bar = get_node("UI/Player/AP")
		$UI/Player/AP.visible = true
		var tween = get_tree().create_tween()
		tween.tween_property($UI/Player/AP, "value", Global.PlayerStartingAP, 1)
	await get_tree().create_timer(1.0).timeout
	PlayerTurn()


func _on_attack_enemy_1_button_pressed():
	$UI/Buttons/TargetButtons.visible = false
	await DisplayText("You attack " + Global.Enemy1Name)
	await DamageToEnemy1(Global.PlayerAttack)



func _on_attack_back_button_pressed():
	$UI/Buttons/TargetButtons.visible = false
	for i in buttons:
		i.visible = true


func _on_attack_enemy_2_button_pressed():
	$UI/Buttons/TargetButtons.visible = false
	await DisplayText("You attack " + Global.Enemy2Name)
	await DamageToEnemy2(Global.PlayerAttack)


func _on_attack_enemy_3_button_pressed():
	$UI/Buttons/TargetButtons.visible = false
	await DisplayText("You attack " + Global.Enemy3Name)
	await DamageToEnemy3(Global.PlayerAttack)


func _on_attack_enemy_4_button_pressed():
	$UI/Buttons/TargetButtons.visible = false
	await DisplayText("You attack " + Global.Enemy4Name)
	await DamageToEnemy4(Global.PlayerAttack)
