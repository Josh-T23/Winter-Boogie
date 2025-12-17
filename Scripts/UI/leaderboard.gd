extends Node

const SAVE_PATH := "user://leaderboard.save"
const MAX_ENTRIES := 8

var scores: Array[int] = []

func _ready():
	load_scores()

func add_score(new_score) -> void:
	var score := int(round(new_score))
	scores.append(score)

	scores.sort()
	scores.reverse()

	if scores.size() > MAX_ENTRIES:
		scores.resize(MAX_ENTRIES)

	save_scores()

func get_scores() -> Array[int]:
	return scores.duplicate()

func save_scores() -> void:
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_var(scores)

func load_scores() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return

	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file:
		var loaded = file.get_var()
		if loaded is Array:
			scores = loaded
