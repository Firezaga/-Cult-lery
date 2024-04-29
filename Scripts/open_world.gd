extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.PlayerMove = true
	$PlayerOpenWorldT.position = Vector2(Global.PlayerLocX, Global.PlayerLocY)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_pressed("skip_cutscene") && Global.PlayerMove):
		Global.PlayerMove = false
		await get_tree().create_timer(2).timeout
		Global.PlayerMove = true
	


func _on_village_area_entered(area):
	Global.goto_main_village()
