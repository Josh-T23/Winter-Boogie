extends RigidBody3D

@export var speed = 5.0
@export var dir = Vector3(0, 0, 1)
@export var player: Node3D

func _physics_process(delta):
	if not player:
		return
		
	dir = (player.global_position - global_position).normalized()
	
	linear_velocity = dir * speed
	
	if global_position.distance_to(player.global_position) < .1:
		queue_free()
