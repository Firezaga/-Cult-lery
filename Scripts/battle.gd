extends CanvasLayer

var battle_start
var battle
var buttons_w_back
var buttons
var battle_text

var player_health_bar
var enemy1_health_bar

var current_weapon = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	battle_start = get_tree().get_nodes_in_group("BattleStart")
	battle = get_tree().get_nodes_in_group("Battle")
	buttons_w_back = get_tree().get_nodes_in_group("ButtonsWBack")
	buttons = get_tree().get_nodes_in_group("Buttons")
	battle_text = get_node("UI/Buttons/ButtonBackground/BattleText")
	player_health_bar = get_node("UI/Player/PlayerHealth")
	enemy1_health_bar = get_node("UI/Enemy/Enemy1Health")
	
	for i in len(battle_start):
		var j = battle_start[i]
		j.visible = true
	for i in len(battle):
		var j = battle[i]
		j.visible = false
	$BattleStart/AnimationPlayer.play("battle_start")
	battle_text.text = Global.Enemy1Name
	$Enemy/Enemy1.texture = ResourceLoader.load(Global.Enemy1)
	
	
	
	if Global.PlayerWeapon1 != null:
		$Player/Weapon1.texture = Global.PlayerWeapon1
	if Global.PlayerWeapon2 != null:
		$Player/Weapon2.texture = Global.PlayerWeapon2
	if Global.PlayerWeapon3 != null:
		$Player/Weapon3.texture = Global.PlayerWeapon3
	if Global.PlayerWeapon4 != null:
		$Player/Weapon4.texture = Global.PlayerWeapon4
	
	player_health_bar.max_value = Global.PlayerMaxHealth
	player_health_bar.value = Global.PlayerCurHealth
	enemy1_health_bar.max_value = Global.Enemy1Health
	enemy1_health_bar.value = Global.Enemy1Health
	await get_tree().create_timer(5.0).timeout


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func DisplayText(text):
	battle_text.text = " "
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
	var health = Global.PlayerCurHealth
	var tween = get_tree().create_tween()
	tween.tween_property(player_health_bar, "value", Global.PlayerCurHealth, 0.5)
	await DisplayText(str(damage) + " points of damage recieved.")


func DamageToEnemy1(amount):
	var damage = amount - Global.Enemy1Defense
	if damage < 0:
		damage = 0
	Global.Enemy1Health -= damage
	var health = Global.Enemy1Health
	var tween = get_tree().create_tween()
	tween.tween_property(enemy1_health_bar, "value", Global.Enemy1Health, 0.5)
	tween.tween_property($UI/Player/AP, "value", $UI/Player/AP.value + 25, 0.5)
	await DisplayText(str(damage) + " points of damage dealt to " + Global.Enemy1Name)


func PlayerTurn():
	battle_text.visible = false
	for i in len(buttons):
		var j = buttons[i]
		j.visible = true


func _on_attack_button_pressed():
	for i in len(buttons):
		var j = buttons[i]
		j.visible = false
	await DisplayText("You attack.")
	await DamageToEnemy1(Global.PlayerAttack)
	EnemyTurn()


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
	await DisplayText(Global.Enemy1Name + "'s turn.")
	await DisplayText(Global.Enemy1Name + " attacks.")
	await DamageToPlayer(Global.Enemy1Attack)
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
	if Global.PlayerAP == 1:
		var bar = get_node("UI/Player/AP")
		$UI/Player/AP.visible = true
		var tween = get_tree().create_tween()
		tween.tween_property($UI/Player/AP, "value", Global.PlayerStartingAP, 1)
	await get_tree().create_timer(1.0).timeout
	PlayerTurn()
