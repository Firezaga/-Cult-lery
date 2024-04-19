extends Area2D

@export var speed = 1000;
@export var can_move = true

func _process(delta):
	if !can_move:
		return
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	position += velocity * delta
	
