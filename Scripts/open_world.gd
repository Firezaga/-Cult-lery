extends Node2D

var rng

# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	Global.PlayerMove = true
	$PlayerOpenWorldT.position = Vector2(Global.PlayerLocX, Global.PlayerLocY)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_pressed("skip_cutscene") && Global.PlayerMove):
		Global.PlayerMove = false
		await get_tree().create_timer(2).timeout
		Global.PlayerMove = true
	


func pick_enemy_type(enemyID):
	rng.randomize()
	var ET = rng.randi_range(1, 4)
	if enemyID == 1:
		if ET == 1:
			Global.Enemy1 = "res://Art/Bosses/Choc Ingrate Boss/Choc Ingrate Boss Idle Sprite.png"
			Global.Enemy1Name = "Chocingrate"
			Global.Enemy1Health = 50
			Global.Enemy1Attack = 10
			Global.Enemy1Defense = 5
		if ET == 2:
			Global.Enemy1 = "res://Art/Bosses/Eyes Cream Boss/Eyes Cream Boss Idle Sprite.png"
			Global.Enemy1Name = "Eyescream"
			Global.Enemy1Health = 30
			Global.Enemy1Attack = 5
			Global.Enemy1Defense = 5
		if ET == 3:
			Global.Enemy1 = "res://Art/Bosses/Jawllipop Boss/Jawllipop Boss Idle Sprite.png"
			Global.Enemy1Name = "Jawllipop"
			Global.Enemy1Health = 40
			Global.Enemy1Attack = 15
			Global.Enemy1Defense = 10
		if ET == 4:
			Global.Enemy1 = "res://Art/Bosses/Raddish Boss/Radish Boss Idle Sprite.png"
			Global.Enemy1Name = "Chaddish"
			Global.Enemy1Health = 50
			Global.Enemy1Attack = 10
			Global.Enemy1Defense = 5
	if enemyID == 2:
		if ET == 1:
			Global.Enemy2 = "res://Art/Bosses/Choc Ingrate Boss/Choc Ingrate Boss Idle Sprite.png"
			Global.Enemy2Name = "Chocingrate"
			Global.Enemy2Health = 50
			Global.Enemy2Attack = 10
			Global.Enemy2Defense = 5
		if ET == 2:
			Global.Enemy2 = "res://Art/Bosses/Eyes Cream Boss/Eyes Cream Boss Idle Sprite.png"
			Global.Enemy2Name = "Eyescream"
			Global.Enemy2Health = 30
			Global.Enemy2Attack = 5
			Global.Enemy2Defense = 5
		if ET == 3:
			Global.Enemy2 = "res://Art/Bosses/Jawllipop Boss/Jawllipop Boss Idle Sprite.png"
			Global.Enemy2Name = "Jawllipop"
			Global.Enemy2Health = 40
			Global.Enemy2Attack = 15
			Global.Enemy2Defense = 10
		if ET == 4:
			Global.Enemy2 = "res://Art/Bosses/Raddish Boss/Radish Boss Idle Sprite.png"
			Global.Enemy2Name = "Chaddish"
			Global.Enemy2Health = 50
			Global.Enemy2Attack = 10
			Global.Enemy2Defense = 5
	if enemyID == 3:
		if ET == 1:
			Global.Enemy3 = "res://Art/Bosses/Choc Ingrate Boss/Choc Ingrate Boss Idle Sprite.png"
			Global.Enemy3Name = "Chocingrate"
			Global.Enemy3Health = 50
			Global.Enemy3Attack = 10
			Global.Enemy3Defense = 5
		if ET == 2:
			Global.Enemy3 = "res://Art/Bosses/Eyes Cream Boss/Eyes Cream Boss Idle Sprite.png"
			Global.Enemy3Name = "Eyescream"
			Global.Enemy3Health = 30
			Global.Enemy3Attack = 5
			Global.Enemy3Defense = 5
		if ET == 3:
			Global.Enemy3 = "res://Art/Bosses/Jawllipop Boss/Jawllipop Boss Idle Sprite.png"
			Global.Enemy3Name = "Jawllipop"
			Global.Enemy3Health = 40
			Global.Enemy3Attack = 15
			Global.Enemy3Defense = 10
		if ET == 4:
			Global.Enemy3 = "res://Art/Bosses/Raddish Boss/Radish Boss Idle Sprite.png"
			Global.Enemy3Name = "Chaddish"
			Global.Enemy3Health = 50
			Global.Enemy3Attack = 10
			Global.Enemy3Defense = 5
	if enemyID == 4:
		if ET == 1:
			Global.Enemy4 = "res://Art/Bosses/Choc Ingrate Boss/Choc Ingrate Boss Idle Sprite.png"
			Global.Enemy4Name = "Chocingrate"
			Global.Enemy4Health = 50
			Global.Enemy4Attack = 10
			Global.Enemy4Defense = 5
		if ET == 2:
			Global.Enemy4 = "res://Art/Bosses/Eyes Cream Boss/Eyes Cream Boss Idle Sprite.png"
			Global.Enemy4Name = "Eyescream"
			Global.Enemy4Health = 30
			Global.Enemy4Attack = 5
			Global.Enemy4Defense = 5
		if ET == 3:
			Global.Enemy4 = "res://Art/Bosses/Jawllipop Boss/Jawllipop Boss Idle Sprite.png"
			Global.Enemy4Name = "Jawllipop"
			Global.Enemy4Health = 40
			Global.Enemy4Attack = 15
			Global.Enemy4Defense = 10
		if ET == 4:
			Global.Enemy4 = "res://Art/Bosses/Raddish Boss/Radish Boss Idle Sprite.png"
			Global.Enemy4Name = "Chaddish"
			Global.Enemy4Health = 50
			Global.Enemy4Attack = 10
			Global.Enemy4Defense = 5
	


func _on_village_area_entered(area):
	Global.goto_main_village()


func _on_area_2d_area_entered(area):
	Global.PlayerMove = false
	rng.randomize()
	Global.EnemyNumberOf = rng.randi_range(1, 4)
	if Global.EnemyNumberOf == 1:
		pick_enemy_type(1)
	if Global.EnemyNumberOf == 2:
		pick_enemy_type(1)
		pick_enemy_type(2)
	if Global.EnemyNumberOf == 3:
		pick_enemy_type(1)
		pick_enemy_type(2)
		pick_enemy_type(3)
	if Global.EnemyNumberOf == 4:
		pick_enemy_type(1)
		pick_enemy_type(2)
		pick_enemy_type(3)
		pick_enemy_type(4)
	Global.load_battle()
