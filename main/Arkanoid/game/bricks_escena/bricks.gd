extends CanvasGroup

signal powerup

var brick_scenes = {"blue" : preload("res://main/Arkanoid/game/ladrillos_escenas/blue.tscn"),
					"red" : preload("res://main/Arkanoid/game/ladrillos_escenas/red.tscn"),
					"yellow" : preload("res://main/Arkanoid/game/ladrillos_escenas/yellow.tscn"),
					"pink" : preload("res://main/Arkanoid/game/ladrillos_escenas/pink.tscn"),
					"green": preload("res://main/Arkanoid/game/ladrillos_escenas/green.tscn")}
					
var brick_width = 56
var brick_height = 38
var power = preload("res://main/Arkanoid/game/bricks_escena/powerup.tscn")
var restantes = 0
var ganado = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var rows = 5
	var row = 0
	var columns = 13
	
	var spacing = 0
	
	for scene in brick_scenes:
		for column in columns:
			var brick = brick_scenes[scene].instantiate()
			# Calculamos la posición del ladrillo
			brick.position = Vector2(column * (brick_width + spacing), row * (brick_height + spacing))
			# Añadimos el ladrillo a la escena principal
			add_child(brick)
			restantes += 1
		row += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func erase_brick(brick):
	if brick in get_children():
		
		var posicion = brick.position
		posicion.x += brick_width/2
		posicion.y += brick_height/2
		brick.queue_free()
		remove_child(brick)
		restantes -= 1
		if restantes <= 0:
			ganado = true

		var posibilidad = randi_range(0,100)
		if posibilidad<=30:
			var nuevo_poder = power.instantiate()
			nuevo_poder.position = posicion
			add_child(nuevo_poder)
			nuevo_poder.connect("pw", Callable(self,"_on_new_powerup"))

func _on_new_powerup():
	powerup.emit()

