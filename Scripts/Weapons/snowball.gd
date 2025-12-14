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
		Global.score += 1
		var rootScene = get_tree().root.get_child(1)
		var timesSpawn = 3
		while(timesSpawn != 0):
			var snowmanDeath = load("res://Prefabricated/Mobs/snowman_death.tscn").instantiate()
			rootScene.add_child(snowmanDeath)
			snowmanDeath.global_position = body.global_position
			timesSpawn -= 1
		
		#print(rootScene.name)
		body.queue_free()
		# Play Sound Effect when killing snowman.
		SnowballHit.play()
		#rootScene.emit_signal("playSound", "Pillow")
