extends RigidBody3D

@export var speed = 5.0
@export var dir = Vector3(0, 0, 1)
@export var player: Node3D

signal snowman_died

func _ready():
	snowman_died.connect(_died)

func _physics_process(delta):
	if not player:
		return
		
	dir = (player.global_position - global_position).normalized()
	
	linear_velocity = dir * speed
	
	if global_position.distance_to(player.global_position) < .1:
		queue_free()
		
func _died():
	#print("Snowman Parent: ", get_parent().name)
	var parent = get_parent()
	# Play Sound Effect when killing snowman.
	parent.emit_signal("playSound", "Pillow")


func _on_body_entered(body):
	print(body)
	if "weapon" in body.name:
		_died()
