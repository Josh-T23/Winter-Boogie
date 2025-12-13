extends Area3D

func _on_body_entered(body):
	#print("body: ", body.name)
	#print("Something collided")
	if body.name.contains("SnowmanReal"):
		#print("Detecting a snowman!")
		var rootScene = get_tree().root.get_child(1)
		body.queue_free()
		# Play Sound Effect when killing snowman.
		rootScene.emit_signal("playSound", "Bat")
