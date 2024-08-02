extends StaticBody2D

var life 
func _ready():
	name = "brick"
	life = 2

func get_id():
	return $CollisionShape2D.get_instance_id()

func mortal_damage():
	life -= 1
	if life == 0:
		return true
	else:
		return false
