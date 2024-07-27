extends CharacterBody2D
var speed = 500
signal golPl1


# Called when the node enters the scene tree for the first time.
func _ready():
	show()
	position = Vector2(30,324)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("pl1_arriba"):
		velocity.y -= 1
	elif Input.is_action_pressed("pl1_abajo"):
		velocity.y += 1

	if velocity.length() > 0:
		velocity *= speed
		
	move_and_collide(velocity * delta)


func _on_pelota_gol_der():
	emit_signal("golPl1")


func _on_mesa_ganador():
	hide()
