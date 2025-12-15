extends Node3D

@export var area_size_meters: float = 100.0
@export var spacing_meters: float = 5.0
@export var ground_height: float = 0.0

const TREE_SCENE_PATH := "res://Assets/Models/Tree.tscn"

func _ready():
	spawn_trees()

func spawn_trees():
	var tree_scene := load(TREE_SCENE_PATH)
	if tree_scene == null:
		push_error("Failed to load Tree.tscn")
		return

	var half_size := area_size_meters / 2.0

	var x := -half_size
	while x <= half_size:
		var z := -half_size
		while z <= half_size:
			var tree = tree_scene.instantiate()
			tree.position = Vector3(x, ground_height, z)
			add_child(tree)

			z += spacing_meters
		x += spacing_meters
