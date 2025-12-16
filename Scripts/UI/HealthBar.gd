extends Node3D

@export var max_health = 3
var health = 3

@onready var fill := $Fill

func set_health(value: int):
	health = clamp(value, 0, max_health)
	var pct = float(health) / max_health
	fill.scale.x = pct
	fill.position.x = (pct - 1.0) * 0.5
