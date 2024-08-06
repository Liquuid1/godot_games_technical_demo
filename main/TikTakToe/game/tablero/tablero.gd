extends CanvasGroup

var equis = preload("res://main/TikTakToe/game/Equis/equis.tscn")
var circulo = preload("res://main/TikTakToe/game/Circulo/circulo.tscn")
var gana_x = preload("res://main/TikTakToe/game/ganar/ganadorX.tscn")
var gana_o = preload("res://main/TikTakToe/game/ganar/ganador_o.tscn")
var no_gana = preload("res://main/TikTakToe/game/ganar/empate.tscn")

var juega_equis = true
var ganador
var grilla = [[0,0,0],[0,0,0],[0,0,0]]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ganador == "Jugador1":
		var pantalla = gana_x.instantiate()
		pantalla.position.x = 1152/2
		pantalla.position.y = 100
		add_child(pantalla)
		$cuadros.hide()
	elif ganador == "Jugador2":
		var pantalla = gana_o.instantiate()
		pantalla.position.x = 1152/2
		pantalla.position.y = 100
		add_child(pantalla)
		$cuadros.hide()
	elif empate(grilla):
		var pantalla = no_gana.instantiate()
		pantalla.position.x = 1152/2
		pantalla.position.y = 100
		add_child(pantalla)
		$cuadros.hide()		

func empate(juego):
	var flag = true
	for i in range(3):
		for o in range(3):
			if not juego[i][o]:
				flag = false
	return flag


func _on__input_event_0_0(viewport, event, shape_idx):
	if not grilla[0][0]:
		if event.as_text() == 'Left Mouse Button':
			if juega_equis:
				var pos = $cuadros/'1'.position
				var jugada = equis.instantiate()
				jugada.position = pos
				add_child(jugada)
				juega_equis = false
				grilla[0][0] = 1
				ganador = victory_for(grilla,1)
			else:
				var pos = $cuadros/'1'.position
				var jugada = circulo.instantiate()
				jugada.position = pos
				add_child(jugada)
				juega_equis = true
				grilla[0][0] = -1
				ganador = victory_for(grilla,-1)


func _on__input_event_1_0(viewport, event, shape_idx):
	if not grilla[1][0]:
		if event.as_text() == 'Left Mouse Button':
			if juega_equis:
				var pos = $cuadros/'2'.position
				var jugada = equis.instantiate()
				jugada.position = pos
				add_child(jugada)
				juega_equis = false
				grilla[1][0] = 1
				ganador = victory_for(grilla,1)
			else:
				var pos = $cuadros/'2'.position
				var jugada = circulo.instantiate()
				jugada.position = pos
				add_child(jugada)
				juega_equis = true
				grilla[1][0] = -1
				ganador = victory_for(grilla,-1)



func _on__input_event_2_0(viewport, event, shape_idx):
	if not grilla[2][0]:
		if event.as_text() == 'Left Mouse Button':
			if juega_equis:
				var pos = $cuadros/'3'.position
				var jugada = equis.instantiate()
				jugada.position = pos
				add_child(jugada)
				juega_equis = false
				grilla[2][0] = 1
				ganador = victory_for(grilla,1)
			else:
				var pos = $cuadros/'3'.position
				var jugada = circulo.instantiate()
				jugada.position = pos
				add_child(jugada)
				juega_equis = true
				grilla[2][0] = -1
				ganador = victory_for(grilla,-1)

func _on__input_event_0_1(viewport, event, shape_idx):
	if not grilla[0][1]:
		if event.as_text() == 'Left Mouse Button':
			if juega_equis:
				var pos = $cuadros/'4'.position
				var jugada = equis.instantiate()
				jugada.position = pos
				add_child(jugada)
				juega_equis = false
				grilla[0][1] = 1
				ganador = victory_for(grilla,1)
			else:
				var pos = $cuadros/'4'.position
				var jugada = circulo.instantiate()
				jugada.position = pos
				add_child(jugada)
				juega_equis = true
				grilla[0][1] = -1
				ganador = victory_for(grilla,-1)


func _on__input_event_1_1(viewport, event, shape_idx):
	if not grilla[1][1]:
		if event.as_text() == 'Left Mouse Button':
			if juega_equis:
				var pos = $cuadros/'5'.position
				var jugada = equis.instantiate()
				jugada.position = pos
				add_child(jugada)
				juega_equis = false
				grilla[1][1] = 1
				ganador = victory_for(grilla,1)
			else:
				var pos = $cuadros/'5'.position
				var jugada = circulo.instantiate()
				jugada.position = pos
				add_child(jugada)
				juega_equis = true
				grilla[1][1] = -1
				ganador = victory_for(grilla,-1)

func _on__input_event_2_1(viewport, event, shape_idx):
	if not grilla[2][1]:
		if event.as_text() == 'Left Mouse Button':
			if juega_equis:
				var pos = $cuadros/'6'.position
				var jugada = equis.instantiate()
				jugada.position = pos
				add_child(jugada)
				juega_equis = false
				grilla[2][1] = 1
				ganador = victory_for(grilla,1)
			else:
				var pos = $cuadros/'6'.position
				var jugada = circulo.instantiate()
				jugada.position = pos
				add_child(jugada)
				juega_equis = true
				grilla[2][1] = -1
				ganador = victory_for(grilla,-1)


func _on__input_event_0_2(viewport, event, shape_idx):
	if not grilla[0][2]:
		if event.as_text() == 'Left Mouse Button':
			if juega_equis:
				var pos = $cuadros/'7'.position
				var jugada = equis.instantiate()
				jugada.position = pos
				add_child(jugada)
				juega_equis = false
				grilla[0][2] = 1
				ganador = victory_for(grilla,1)
			else:
				var pos = $cuadros/'7'.position
				var jugada = circulo.instantiate()
				jugada.position = pos
				add_child(jugada)
				juega_equis = true
				grilla[0][2] = -1
				ganador = victory_for(grilla,-1)


func _on__input_event_1_2(viewport, event, shape_idx):
	if not grilla[1][2]:
		if event.as_text() == 'Left Mouse Button':
			if juega_equis:
				var pos = $cuadros/'8'.position
				var jugada = equis.instantiate()
				jugada.position = pos
				add_child(jugada)
				juega_equis = false
				grilla[1][2] = 1
				ganador = victory_for(grilla,1)
			else:
				var pos = $cuadros/'8'.position
				var jugada = circulo.instantiate()
				jugada.position = pos
				add_child(jugada)
				juega_equis = true
				grilla[1][2] = -1
				ganador = victory_for(grilla,-1)


func _on__input_event_2_2(viewport, event, shape_idx):
	if not grilla[2][2]:
		if event.as_text() == 'Left Mouse Button':
			if juega_equis:
				var pos = $cuadros/'9'.position
				var jugada = equis.instantiate()
				jugada.position = pos
				add_child(jugada)
				juega_equis = false
				grilla[2][2] = 1
				ganador = victory_for(grilla,1)
			else:
				var pos = $cuadros/'9'.position
				var jugada = circulo.instantiate()
				jugada.position = pos
				add_child(jugada)
				juega_equis = true
				grilla[2][2] = -1
				ganador = victory_for(grilla,-1)

func victory_for(board, sign): #Señala si es que alguien ya gano el juego.
	var who
	if sign==1:
		who="Jugador1"
	elif sign==-1:
		who = "Jugador2"
	
	var diagonal1 = true
	var diagonal2 = true
	for i in range(3):
		if board[i][0]==sign and board[i][1]==sign and board[i][2]==sign:
			return who
		if board[0][i]==sign and board[1][i]==sign and board[2][i]==sign:
			return who
		if board[i][i]!=sign:
			diagonal1= false
		if board[i-2][i-2]!=sign:
			diagonal2= false
	if diagonal1 or diagonal2:
		return who
	return 
