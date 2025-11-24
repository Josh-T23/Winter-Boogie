extends CharacterBody3D

@export var speed = 5.0
@export var dir = Vector3(0, 0, 1)
@export var player: Node3D
#@onready 

signal snowman_died

func _ready():
	snowman_died.connect(_died)
@export var player : Node3D

func _physics_process(delta):
	if player == null:
		return

	var direction = (player.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()

	if global_position.distance_to(player.global_position) < .1:
		queue_free()
		
func _died():
	#print("Snowman Parent: ", get_parent().name)
	var parent = get_parent()
	# Play Sound Effect when killing snowman.
	parent.emit_signal("playSound", "Pillow")
