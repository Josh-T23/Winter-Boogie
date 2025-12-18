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
		Global.score += 4
		if body.hp - 1 > 0:
			body.hp -= 1
			var getLabel = body.get_node("Label3D")
			var heartNums = body.hp
			getLabel.text = ""
			while(heartNums > 0):
				getLabel.text = getLabel.text + "❤️"
				heartNums -= 1
			return
		var rootScene = get_tree().root.get_child(1)
		var timesSpawn = 3
		while(timesSpawn != 0):
			var snowmanDeath = load("res://Prefabricated/Mobs/snowman_death.tscn").instantiate()
			rootScene.add_child(snowmanDeath)
			snowmanDeath.global_position = body.global_position
			timesSpawn -= 1
		
		#print(rootScene.name)
		var bullet = load("res://Prefabricated/Weapons/baseball_ray.tscn").instantiate()
		rootScene.add_child(bullet)
		bullet.global_position = body.global_position * Vector3(1,0,1)
		body.queue_free()
		# Play Sound Effect when killing snowman.
		SnowballHit.play()
		#rootScene.emit_signal("playSound", "Pillow")
