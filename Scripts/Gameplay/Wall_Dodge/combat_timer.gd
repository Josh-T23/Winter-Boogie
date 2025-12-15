extends Timer



func _on_timeout() -> void:
	if Global.round == 3:
		get_tree().change_scene_to_file("res://Scenes/Menus/GameOver.tscn")
		return
	Global.round += 1
	Global.weapon = null
	get_tree().change_scene_to_file("res://Scenes/Gameplay/owen_human_joystick.tscn")
