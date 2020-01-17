extends Node2D

# Called when the node enters the scene tree for the first time.
onready var root =  get_tree().get_root()
onready var level = root.get_child(1)
var personnage
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("reset"):
		level.get_node("Personnage").queue_free()
		personnage = preload("res://personnage.tscn").instance()
		personnage.position.y = -300
		level.add_child(personnage)