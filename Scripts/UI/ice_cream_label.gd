extends Label3D

@onready var timer = $%RayTimer

func _process(delta):
	text = "Time: %.1f" % timer.time_left
