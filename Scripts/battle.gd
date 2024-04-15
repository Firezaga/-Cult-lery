extends CanvasLayer

var battle_start
var battle
var buttons_w_back
var buttons
var battle_text

var Enemy1Name = null
var Enemy1HealthMax = null
var Enemy1HealthCur = null
var Enemy1Attack = null
var Enemy1Defense = null

var Enemy2Name = null
var Enemy2HealthMax = null
var Enemy2HealthCur = null
var Enemy2Attack = null
var Enemy2Defense = null

var Enemy3Name = null
var Enemy3HealthMax = null
var Enemy3HealthCur = null
var Enemy3Attack = null
var Enemy3Defense = null

var player_health_bar
var enemy1_health_bar

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
	
	$Enemy/Enemy1.texture = ResourceLoader.load(Global.Enemy1)
	Enemy1Name = Global.Enemy1Name
	Enemy1HealthMax = Global.Enemy1Health
	Enemy1HealthCur = Enemy1HealthMax
	Enemy1Attack = Global.Enemy1Attack
	Enemy1Defense = Global.Enemy1Defense
	battle_text.text = Enemy1Name
	await get_tree().create_timer(2.0).timeout
	battle_text.visible = false
	
	player_health_bar.max_value = Global.PlayerMaxHealth
	player_health_bar.value = Global.PlayerCurHealth
	enemy1_health_bar.max_value = Enemy1HealthMax
	enemy1_health_bar.value = Enemy1HealthCur


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func DisplayText(text):
	battle_text.text = " "
	battle_text.visible = true
	for i in len(text):
		battle_text.text += text[i]
		await get_tree().create_timer(0.05).timeout
	await get_tree().create_timer(2.0).timeout
	battle_text.visible = false

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
	Enemy1HealthCur -= 50
	enemy1_health_bar.value = Enemy1HealthCur
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
	await DisplayText(Enemy1Name + "'s turn.")
	await DisplayText(Enemy1Name + "attacks.")
	Global.PlayerCurHealth -= 5
	player_health_bar.value = Global.PlayerCurHealth
	PlayerTurn()


func _on_animation_player_animation_finished(anim_name):
	for i in len(battle_start):
		var j = battle_start[i]
		j.visible = false
	for i in len(battle):
		var j = battle[i]
		j.visible = true
	await get_tree().create_timer(1.0).timeout
	PlayerTurn()
