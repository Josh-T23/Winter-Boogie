extends Label3D

var start_time = 10

func _process(delta: float) -> void:
	start_time -= delta
	text = "Time: %.1f" % start_time
	
	if start_time <= 0:
		get_tree().change_scene_to_file("res://weaponSwitch/weapon_switch.tscn")
