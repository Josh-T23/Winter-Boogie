extends Node3D

@onready var snowman_scene = load("res://snowman.tscn")
@onready var scene_root = get_tree().current_scene
@onready var timer = $"Timer"

@export var player: Node3D
@export var low_time = 0.25
@export var high_time = 3.0

func _ready():
	timer.one_shot = false
	timer.wait_time = randf_range(low_time, high_time)
	timer.start()

func _on_timer_timeout():
	spawn()

func spawn():
	var instance = snowman_scene.instantiate()

	var angle = randf() * TAU
	var r = 20.0  

	var x = cos(angle) * r
	var z = sin(angle) * r



	instance.global_position = player.global_position + Vector3(x, .875, z)


	instance.speed = randf_range(1, 4)

	instance.player = player

	scene_root.add_child(instance)
