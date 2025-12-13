extends Node3D

# Despawn snowman death parts after time runs out.
func _on_timer_timeout():
	queue_free()
