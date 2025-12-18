extends Area3D
@onready var pillowAudio = $%PillowAudio
@export var damage = 2

func _on_body_entered(body):
	#print("body: ", body.name)
	#print("Something collided")
	if body.name.contains("SnowmanReal"):
		#print("Detecting a snowman!")
		Global.score += 1
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
		#var rootScene = get_tree().root.get_child(1)
		print(rootScene.name)
		
		#if body.has_method("take_damage"):
			#body.take_damage(damage)
		
		body.queue_free()
		# Play Sound Effect when killing snowman.
		#rootScene.emit_signal("playSound", "Pillow")
		pillowAudio.play()
