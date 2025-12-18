extends Node3D

@onready var weak_snowman = load("res://Prefabricated/Mobs/snowman_weak.tscn")
@onready var medium_snowman = load("res://Prefabricated/Mobs/snowman_medium.tscn")
@onready var strong_snowman = load("res://Prefabricated/Mobs/snowman_strong.tscn")
@onready var scene_root = get_tree().current_scene
@onready var timer = $"Timer"
@onready var snowmanSpawnTimer= $%SnowmanSpawnTimer

@export var player: Node3D
@export var dist = 12
@export var low_time = 1.0
@export var high_time = 3.0
@export var positionUsed = 0

var num = 0

func _ready():
	timer.one_shot = false
	timer.wait_time = randf_range(low_time, high_time / Global.round)
	timer.start()

func _on_timer_timeout():
	spawn()

# Make fog appears first then snowman spawn in.
func spawn():
<<<<<<< Updated upstream
	var fog = load("res://Prefabricated/Mobs/spawn_fog.tscn").instantiate()
	
=======
	var instance = medium_snowman.instantiate()
	instance.name = "SnowmanReal" + str(num)
	num += 1
	scene_root.add_child(instance)

>>>>>>> Stashed changes
	# pick a random angle on the circle
	var angle = randf() * TAU
	var r = 20.0  

	var x = cos(angle) * r
	var z = sin(angle) * r


	#instance.global_position = player.global_position + Vector3(x, 0, z)
	positionUsed = player.global_position + Vector3(randf_range(-12, 12), 0, z)

	fog.global_position = positionUsed
	scene_root.add_child(fog)
	snowmanSpawnTimer.start()


# Make snowman appears
func snowmanShow(snowPosition):
	var instance = snowman_scene.instantiate()
	instance.name = instance.name + str(num)
	num += 1
	scene_root.add_child(instance)
	instance.global_position = snowPosition
	instance.speed = randf_range(1, 3.5)

	instance.player = player


func _on_snowman_spawn_timer_timeout():
	if positionUsed is int: return
	snowmanShow(positionUsed)
