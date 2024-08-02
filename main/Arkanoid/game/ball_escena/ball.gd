extends CharacterBody2D


const SPEED = 300.0
signal hit_brick(brick)

func _ready():
	add_to_group("balls")

func _physics_process(delta):
	var collision_info = move_and_collide(velocity  * delta)
	
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
		if velocity.x > -150 and velocity.x < 0:
			velocity.x = -150
		if velocity.x < 150 and velocity.x > 0:
			velocity.x = 150
			
		if velocity.y < -300:
			velocity.y = -300
		if velocity.y >300:
			velocity.y = 300
		
		var col = collision_info.get_collider()
		if "brick" in col.name:
			hit_brick.emit(col)
			
	if position.y > 450:
		queue_free()

func start():
	velocity = Vector2.ZERO
	
	velocity.y = -1

	if randi()%2==0:
		velocity.x = -1
	else:
		velocity.x = 1
	
	if velocity.length() > 0:
		velocity *= SPEED

func add_exception():
	var grupo = get_tree().get_nodes_in_group("balls")
	for ball in grupo:
		if ball != self:
			add_collision_exception_with(ball)
