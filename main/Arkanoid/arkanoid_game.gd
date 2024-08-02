extends Node2D

const WIN_SCREEN_PATH = "res://main/Arkanoid/game/escenas ganar o perder/ganaste.tscn"
const LOSE_SCREEN_PATH = "res://main/Arkanoid/game/escenas ganar o perder/perdiste.tscn"

var ganado = false
var perdido = false
var vidas = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if not get_tree().has_group("balls") and not perdido and not ganado:
		handle_loss()

func _on_control_hit(brick):
	$bricks.erase_brick(brick)
	if $bricks.ganado:
		win_game()
	
func win_game():
	ganado = true
	end_game()
	show_screen(WIN_SCREEN_PATH)
	
func lose_game():
	perdido = true
	vidas -= 1
	if vidas == 0:
		end_game()
		show_screen(LOSE_SCREEN_PATH)
	else:
		re_draw()

func _on_bricks_powerup():
	$control.new_ball()
	
func re_draw():
	$control._ready()
	$control.show()
	$bricks.show()
	perdido = false
	
func handle_loss():
	$control.hide()
	$bricks.hide()
	lose_game()
	
func end_game():
	$control.queue_free()
	$bricks.queue_free()
	
func show_screen(screen_path):
	var screen = load(screen_path).instantiate()
	screen.position.x = 1152 / 2
	add_child(screen)
