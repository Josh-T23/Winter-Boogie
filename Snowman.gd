extends CharacterBody3D

@export var speed = 5.0
@export var player : Node3D

func _physics_process(delta):
	if player == null:
		return

	var direction = (player.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()

	if global_position.distance_to(player.global_position) < .1:
		queue_free()
