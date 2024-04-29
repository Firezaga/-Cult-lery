extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.PlayerMove = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_open_world_area_entered(area):
	Global.PlayerLocX = 641
	Global.PlayerLocY = -841
	Global.goto_open_world()
