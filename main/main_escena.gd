extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_salir_pressed():
	get_tree().quit()


func _on_pong_pressed():
	get_tree().change_scene_to_file("res://main/pong/pong.tscn")


func _on_snake_pressed():
	get_tree().change_scene_to_file("res://main/Snake/Snake.tscn")


func _on_tik_tak_toe_pressed():
	get_tree().change_scene_to_file("res://main/TikTakToe/TikTakToe.tscn")


func _on_frogger_pressed():
	get_tree().change_scene_to_file("res://main/Frogger/frogger.tscn")


func _on_arkanoid_pressed():
	get_tree().change_scene_to_file("res://main/Arkanoid/arkanoid.tscn")
