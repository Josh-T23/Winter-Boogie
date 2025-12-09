extends Node3D

@onready var snowman_scene = load("res://Monsters/snowman_real.tscn")
@onready var scene_root = get_tree().current_scene
@onready var timer = $"Timer"

@export var player: Node3D
@export var dist = 12
@export var low_time = 1.5
@export var high_time = 3.0

var num = 0

func _ready():
	timer.one_shot = false
	timer.wait_time = randf_range(low_time, high_time / Global.round)
	timer.start()

func _on_timer_timeout():
	spawn()

func spawn():
	var instance = snowman_scene.instantiate()
	instance.name = instance.name + str(num)
	num += 1
	scene_root.add_child(instance)

	# pick a random angle on the circle
	var angle = randf() * TAU
	var r = 20.0  

	var x = cos(angle) * r
	var z = sin(angle) * r


	#instance.global_position = player.global_position + Vector3(x, 0, z)
	instance.global_position = player.global_position + Vector3(randf_range(12, 4), 0, z)

	instance.speed = randf_range(1, 3.5)

	instance.player = player

	
