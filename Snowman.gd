extends RigidBody3D

@export var speed = 5.0
<<<<<<< HEAD
@export var player : Node3D
=======
@export var dir = Vector3(0, 0, 1)
@export var player: Node3D
#@onready 

signal snowman_died

func _ready():
	snowman_died.connect(_died)
<<<<<<< HEAD
>>>>>>> parent of ff4789d (Merge branch 'main' into weapon-destruction)
=======
>>>>>>> parent of ff4789d (Merge branch 'main' into weapon-destruction)

func _physics_process(delta):
	if not player:
		return
		
	dir = (player.global_position - global_position).normalized()
	
	linear_velocity = dir * speed
	
	if global_position.distance_to(player.global_position) < .1:
		queue_free()
