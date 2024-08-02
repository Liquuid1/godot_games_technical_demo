extends Area2D

signal pw

func _process(delta):
	position.y += 100 * delta
	
	if position.y > 650:
		queue_free()
		
func _on_body_entered(body):
	if body.name == "player":
		pw.emit()
		queue_free()
	
