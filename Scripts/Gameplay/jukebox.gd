extends AudioStreamPlayer3D

@onready var round_music := {
	1: preload("res://Assets/Audio/Round 1.mp3"),
	2: preload("res://Assets/Audio/Round 2.mp3"),
	3: preload("res://Assets/Audio/Round 3.mp3")
}

var current_round := -1

func _ready():
	update_music()

func _process(_delta):
	if Global.round != current_round:
		update_music()

func update_music():
	current_round = Global.round
	
	if round_music.has(current_round):
		if stream != round_music[current_round]:
			stream = round_music[current_round]
			play()
	else:
		stop()
