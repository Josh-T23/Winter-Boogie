extends Label3D

var start_time = 20

func _process(delta: float) -> void:
	start_time -= delta
	text = "Time: %.1f" % start_time
	
	if start_time <= 0:
		var score = $"../Score".score
		Global.score += score
		get_tree().change_scene_to_file("res://Scenes/Menus/weapon_switch.tscn")
