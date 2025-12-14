extends Label3D

#var score = 0

func _process(delta):
	text = "Score: " + str(Global.score)
