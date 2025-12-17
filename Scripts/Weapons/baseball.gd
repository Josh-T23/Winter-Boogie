extends Area3D

func _on_body_entered(body):
	#print("body: ", body.name)
	#print("Something collided")
	if body.name.contains("SnowmanReal"):
		#print("Detecting a snowman!")
		Global.score += 4
		var rootScene = get_tree().root.get_child(1)
		var timesSpawn = 3
		while(timesSpawn != 0):
			var snowmanDeath = load("res://Prefabricated/Mobs/snowman_death.tscn").instantiate()
			rootScene.add_child(snowmanDeath)
			snowmanDeath.global_position = body.global_position
			timesSpawn -= 1
		body.queue_free()
		# Play Sound Effect when killing snowman.
		rootScene.emit_signal("playSound", "Bat")
