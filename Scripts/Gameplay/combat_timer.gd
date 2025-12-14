extends Label3D

@onready var combat_timer = $%CombatTimer

func _process(delta):
	#start_time -= delta
	text = "Time: %.1f" % combat_timer.time_left
