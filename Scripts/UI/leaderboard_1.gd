extends Node3D

@onready var entries_label: Label3D = $Entries

func _ready():
	update_leaderboard()

func update_leaderboard():
	var scores := Leaderboard.get_scores()
	var text := ""

	if scores.is_empty():
		text = "No scores yet"
	else:
		for i in scores.size():
			text += "%d: %d\n" % [i + 1, scores[i]]

	entries_label.text = text
