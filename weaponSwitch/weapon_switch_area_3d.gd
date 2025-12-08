extends Area3D

@export var cost: int

signal pressed

func _ready() -> void:
	if Global.score < cost:
		visible = false
		set_collision_layer_value(1, false)
