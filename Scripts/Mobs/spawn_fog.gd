extends Node3D

# Despawn fog after snowman spawn
func _on_timer_timeout():
	queue_free()
