extends XRController3D


func _on_button_pressed(name: String) -> void:
	if name == "ax_button":
		get_tree().change_scene_to_file("res://weaponSwitch/weapon_switch.tscn")
