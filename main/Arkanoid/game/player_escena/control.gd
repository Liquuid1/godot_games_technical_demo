extends Node2D

signal hit(brick)

# Called when the node enters the scene tree for the first time.
func _ready():
	if not $player/ball:
		var ball = load("res://main/Arkanoid/game/ball_escena/ball.tscn").instantiate()
		ball.position.y = -50
		ball.scale = Vector2(1.3,1.3)
		ball.connect("hit_brick",Callable(self,"_on_ball_hit_brick"))
		$player.add_child(ball)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_player_start():
	var padre = $player
	var hijo = $player/ball
	
	var global_position = hijo.global_position
	padre.remove_child(hijo)
	
	add_child(hijo)
	hijo.global_position = global_position
	hijo.start()

func _on_ball_hit_brick(brick):
	hit.emit(brick)
	
func new_ball():
	var balls = get_tree().get_nodes_in_group("balls")
	var first_ball = get_tree().get_first_node_in_group("balls")
	var new = first_ball.duplicate()
	new.position = first_ball.position
	add_child(new)
	new.connect("hit_brick",Callable(self,"_on_ball_hit_brick"))
	get_tree().call_group("balls","add_exception")
	new.start()
	
