extends Area3D
var time = 2
#func _on_body_entered(body):
	#print("body: ", body.name)
	##print("Something collided")
	#if body.name.contains("SnowmanReal"):
		#print("Detecting a snowman!")
		#var rootScene = get_tree().root.get_child(1)
		#print(rootScene.name)
		#body.queue_free()
		## Play Sound Effect when killing snowman.
		#rootScene.emit_signal("playSound", "Pillow")
		
#func _process(delta):
	#if Input.is_action_pressed("trigger_click"):
		#print("Trigger clicked!")
