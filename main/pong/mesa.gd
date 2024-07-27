extends Node2D
var puntos_izq
var puntos_der
signal ganador


# Called when the node enters the scene tree for the first time.
func _ready():
	puntos_der = 0
	puntos_izq = 0
	$tablero_puntos_izq.text = str(puntos_izq)
	$tablero_puntos_der.text = str(puntos_der)
	$ganador.hide()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_1_gol():
	puntos_izq += 1
	$tablero_puntos_izq.text = str(puntos_izq)
	if puntos_izq >= 5:
		ganar(1)
	


func _on_player_2_gol():
	puntos_der += 1
	$tablero_puntos_der.text = str(puntos_der)
	if puntos_der >= 5:
		ganar(2)
	
func ganar(ganador):
	emit_signal("ganador")
	$red.hide()
	$ganador.show()
	if ganador == 1:
		$ganador/mensaje.text = "GANADOR \nJUGADOR 1"
	else:
		$ganador/mensaje.text = "GANADOR\nJUGADOR 2"


func _on_jugar_pressed():
	get_tree().change_scene_to_file("res://main/pong/mainPong.tscn")


func _on_salir_pressed():
	get_tree().change_scene_to_file("res://main/main_escena.tscn")
