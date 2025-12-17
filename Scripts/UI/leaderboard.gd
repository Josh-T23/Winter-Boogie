extends Node

const SAVE_PATH := "user://leaderboard.save"
const MAX_ENTRIES := 10

var scores: Array[int] = []

func _ready():
	load_scores()

func add_score(new_score: int) -> void:
	scores.append(new_score)
	scores.sort()              # ascending
	scores.reverse()           # descending
	
	if scores.size() > MAX_ENTRIES:
		scores = scores.slice(0, MAX_ENTRIES)
	
	save_scores()

func get_scores() -> Array[int]:
	return scores.duplicate()

func save_scores() -> void:
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_var(scores)
		file.close()

func load_scores() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return
	
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file:
		scores = file.get_var()
		file.close()
