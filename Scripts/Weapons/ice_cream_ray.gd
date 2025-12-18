extends StaticBody3D

@onready var meltAudio = $%MeltingAudio

func _on_timer_timeout():
	queue_free()


func _on_area_3d_body_entered(body):
	if body.name.contains("SnowmanReal"):
		Global.score += 1
		meltAudio.play(7.1)
		if body.hp - 2 > 0:
			body.hp -= 2
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
		body.queue_free()
