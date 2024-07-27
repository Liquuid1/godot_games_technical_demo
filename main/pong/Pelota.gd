extends CharacterBody2D

signal gol_izq
signal gol_der
var ganado = false

const SPEED = 500.0

func _ready():
	if not ganado:
		$Timer.start(1)
		
		velocity = Vector2.ZERO
		position = Vector2(571,304)
		
		if randi()%2==0:
			velocity.y = -1
		else:
			velocity.y = 1

		if randi()%2==0:
			velocity.x = -1
		else:
			velocity.x = 1
		
		if velocity.length() > 0:
			velocity *= SPEED
		
func _physics_process(delta):
	if not ganado:
		if $Timer.is_stopped():
			var collision_info = move_and_collide(velocity  * delta)
			
			if collision_info:
				velocity = velocity.bounce(collision_info.get_normal())
				if velocity.x > -2500 and velocity.x < 2500:
					if velocity.y > -2500 and velocity.y < 2500:
						velocity *= 1.05
				

func _on_arco_izquierda_body_entered(body):
	emit_signal("gol_izq")
	_ready()


func _on_arco_derecha_body_entered(body):
	emit_signal("gol_der")
	_ready()


func _on_mesa_ganador():
	ganado = true
	hide()
