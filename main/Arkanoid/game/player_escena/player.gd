extends CharacterBody2D

signal start

const SPEED = 700.0

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	elif Input.is_action_pressed("ui_left"):
		direction.x -= 1
	
	if $ball and Input.is_action_pressed("espacio"):
		emit_signal("start")
	
	if direction != Vector2.ZERO:
		direction = direction.normalized() * SPEED
	
	move_and_collide(direction * delta)
