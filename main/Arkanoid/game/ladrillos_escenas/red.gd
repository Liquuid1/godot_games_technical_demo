extends StaticBody2D

var life

func _ready():
	name = "brick"
	var life = 4
	
func get_id():
	return $CollisionShape2D.get_instance_id()
	
func mortal_damage():
	life -= 1
	if life == 0:
		return true
	else:
		return false
