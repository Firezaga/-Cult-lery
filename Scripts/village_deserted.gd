extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on__chad_ish_area_entered(area):
	$Foreground/_Chad_ish/AnimationPlayer.play("radish_up")
	


func _on_animation_player_animation_finished(anim_name):
	Global.Enemy1 = "res://Art/Bosses/Raddish Boss/Radish Boss Idle Sprite.png"
	Global.Enemy1Name = "Chadish"
	Global.Enemy1Health = 80
	Global.Enemy1Attack = 20
	Global.Enemy1Defense = 10
	$Foreground/PlayerVillage.set_process(false)
	Global.load_battle()
