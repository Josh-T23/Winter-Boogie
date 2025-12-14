extends XRController3D


func _on_button_pressed(name: String) -> void:
	if name == "ax_button":
		Global.score = 0
		Global.weapon = null
		Global.round = 1
		get_tree().change_scene_to_file("res://Scenes/Menus/starting_scene.tscn")
