extends RigidBody3D

@onready var SnowballHit = $%SnowballHit

# When timer runs out, bullet deletes itself.
func _on_timer_timeout():
	queue_free()


func _on_body_entered(body):
	pass


func _on_area_3d_body_entered(body):
	if body.name.contains("SnowmanReal"):
		#print("Detecting a snowman!")
		var rootScene = get_tree().root.get_child(1)
		#print(rootScene.name)
		body.queue_free()
		# Play Sound Effect when killing snowman.
		SnowballHit.play()
		#rootScene.emit_signal("playSound", "Pillow")
