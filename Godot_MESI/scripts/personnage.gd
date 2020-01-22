extends "res://scripts/entites.gd"

#===== CONSTANTES ===================
const GRAVITY_VEC = Vector2(0, 1900)
const FLOOR_NORMALP = Vector2(0, -1)
const SLOPE_SLIDE_STOP = 0.03
const WALK_SPEED = 1000
const UP = Vector2(0,-1)

#===== VARIABLES ===================
var flocon = preload("res://scenes/FloconNeige.tscn")
var velocityp = Vector2()
var JUMP_SPEED = 700
var linear_v = Vector2()

func _physics_process(delta):
	
	SkillLoop()
		
	var target_speed = 0
	linear_v += delta * GRAVITY_VEC
	linear_v = move_and_slide(linear_v, FLOOR_NORMALP, SLOPE_SLIDE_STOP)
	#if Input.is_action_just_pressed("jump"):
	#	linear_v.y = - JUMP_SPEED
		
	if Input.is_action_just_pressed("move_left"):
		linear_v.x -= 7550
#		target_speed -= 1
#		$Sprite.scale.x = -1
	if Input.is_action_just_pressed("move_right"):
		linear_v.x += 7550
#		target_speed += 1
#		$Sprite.scale.x = 1
	target_speed*= WALK_SPEED
	linear_v.x = lerp(linear_v.x,target_speed,0.5)
	
		
func _process(delta):
	if move_and_collide(velocityp):
		#print("Collision")
		move_and_slide(UP,Vector2(0,-1))
	else:
		#print("Nope")
		pass
	
func _input(event):
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()

func SkillLoop():
	if Input.is_action_pressed("flake"):
		var fball_instance = flocon.instance()
		fball_instance.position = get_global_position()
		fball_instance.rotation = get_angle_to(get_global_position())
		get_parent().add_child(fball_instance)