extends XRController3D


func _on_button_pressed(name: String) -> void:
	if name == "ax_button" and $Timer.is_stopped():
		Global.reset()
		get_tree().change_scene_to_file("res://Scenes/Menus/starting_scene.tscn")
