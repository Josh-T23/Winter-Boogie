extends Label3D

var start_time = 35

func _process(delta: float) -> void:
	start_time -= delta
	text = "Time: start_time %.1f" % start_time
	
	if start_time <= 0:
		get_tree().change_scene_to_file("res://teleportation.tscn")
