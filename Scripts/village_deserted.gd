extends Node2D

var can_talk

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.PlayerMove = true
	await get_tree().create_timer(1.5).timeout
	Global.PlayerMove = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("use") && can_talk:
		can_talk = false
		$Foreground/FortuneTeller/SpeechBubbleIcon.visible = false
		Global.DiaBackground = "res://Art/Village/Deserted Village/Battle/Deserted Cupcake Village Chromatic Abberation.png"
		Global.DiaSpriteLeft = "res://Art/Character/MC Idle Sprite(Open World).png"
		Global.DiaSpriteRight = "res://Art/NPCs/Fortune Teller/Fortune Teller Idle Sprite.png"
		Global.DiaText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pellentesque justo nec odio ultrices, vitae tincidunt nibh mollis. Nulla facilisi. Suspendisse potenti. Vivamus auctor nisl vel nunc mattis, eu sodales nibh molestie. ~Praesent nec nisl nec nunc volutpat mollis. Sed quis nunc nec nunc mattis molestie. Sed auctor nisl nec nunc mattis, eu sodales nibh molestie. Vivamus auctor nisl vel nunc mattis, eu sodales nibh molestie. Praesent nec nisl nec nunc volutpat mollis. Sed quis nunc nec nunc mattis molestie. ~Sed auctor nisl nec nunc mattis, eu sodales nibh molestie.~"
		Global.dialogue()


func _on__chad_ish_area_entered(area):
	$Foreground/_Chad_ish/AnimationPlayer.play("radish_up")
	Global.PlayerMove = false
	


func _on_animation_player_animation_finished(anim_name):
	Global.Enemy1 = "res://Art/Bosses/Raddish Boss/Radish Boss Idle Sprite.png"
	Global.Enemy1Name = "Chadish"
	Global.Enemy1Health = 80
	Global.Enemy1Attack = 20
	Global.Enemy1Defense = 10
	Global.EnemyNumberOf = 1
	Global.load_battle()


func _on_fortune_teller_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	$Foreground/FortuneTeller/SpeechBubbleIcon.visible = true
	can_talk = true




func _on_fortune_teller_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	$Foreground/FortuneTeller/SpeechBubbleIcon.visible = false
	can_talk = false
