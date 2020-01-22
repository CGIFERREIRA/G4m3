extends "res://scripts/entites.gd"

var bounce = 0

func _physics_process(delta:float) -> void:
	#Gravité appliquée au projectile
	velocity.y += gravity * delta
	
	if is_on_wall():
			velocity.x *= -1
			
	if is_on_floor():
		velocity.y -= 800
		bounce += 1
		print(bounce)
	if bounce > 3:
		self.queue_free()
		bounce == 0
		
		
	velocity.y = move_and_slide(velocity,FLOOR_NORMAL).y
	
func _ready():
	velocity.x = - speed.x