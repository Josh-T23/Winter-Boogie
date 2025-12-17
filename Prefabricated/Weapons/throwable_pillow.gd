extends RigidBody3D

# Despawn pillow
func _on_timer_timeout():
	queue_free()
