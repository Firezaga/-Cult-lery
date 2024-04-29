extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	Global.PlayerMove = true
	if (Global.PlayerStoryState == 0):
		Global.PlayerStoryState = 1
		Global.PlayerCurHealth = Global.PlayerMaxHealth
		$"Foreground Art/PlayerVillage".position.x = 5189
		Global.DiaBackground = "res://Art/Village/Main Village/Side Scroller/Sky Background.png"
		Global.DiaSpriteLeft = "res://Art/NPCs/Fortune Teller/Fortune Teller Idle Sprite.png"
		Global.DiaText = "Ah, you're awake. I was beginning to think we'd be feeding you to the carrots.~"
		Global.dialogue()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_open_world_area_entered(area):
	Global.PlayerLocX = 641
	Global.PlayerLocY = -841
	Global.goto_open_world()
