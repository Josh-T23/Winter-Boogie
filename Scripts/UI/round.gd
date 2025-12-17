extends Label3D

@onready var RoundTextTimer = $%RoundTextTimer
@onready var roundOne = $%RoundOne
@onready var roundTwo = $%RoundTwo
@onready var roundThree = $%RoundThree

func _ready():
	RoundTextTimer.start()
	if Global.round == 1:
		roundOne.play()
	if Global.round == 2:
		roundTwo.play()
	if Global.round == 3:
		roundThree.play()

func _process(delta):
	#start_time -= delta
	text = "Round: " + str(Global.round)

# hide round UI after timer ends.
func _on_round_text_timer_timeout():
	queue_free()
