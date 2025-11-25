extends Timer



func _on_timeout() -> void:
	if Global.round == 3:
		Global.reset()
		get_tree().change_scene_to_file("res://starting_scene.tscn")
	Global.round += 1
	Global.weapon = null
	get_tree().change_scene_to_file("res://owen_human_joystick.tscn")
