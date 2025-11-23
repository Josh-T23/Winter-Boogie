extends Node3D

@export var spawn_x_range: Vector2 = Vector2(-1.9, 1.9)
@export var min_interval: float = 0.2
@export var max_interval: float = 1.5
@export var box_name = "Wall"
@export var count: int = 0

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	_start_timer()

func _start_timer():
	var t = rng.randf_range(min_interval, max_interval)
	var timer = Timer.new()
	timer.one_shot = true
	timer.wait_time = t
	add_child(timer)
	timer.timeout.connect(_on_spawn_timer_timeout)
	timer.start()

func _on_spawn_timer_timeout():
	spawn_cube()
	_start_timer()

func spawn_cube():
	var box = preload("res://Wall.tscn").instantiate()

	count += 1
	box.name = box_name
	box.name += str(count)
	
	var x = rng.randf_range(spawn_x_range.x, spawn_x_range.y)
	box.global_transform.origin = Vector3(x, 0, 0)
	
	add_child(box)
