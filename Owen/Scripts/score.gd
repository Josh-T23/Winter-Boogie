extends Label3D

var score = 0

func _process(delta: float) -> void:
	if score < 0:
		score = 0
	text = "Score: " + str(score)
