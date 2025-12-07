extends RigidBody3D

@export var speed = 5.0
@export var dir = Vector3(0, 0, 1)
@export var player: Node3D

#signal snowman_died
#
#func _ready():
	#snowman_died.connect(_died)

func _physics_process(delta):
	if not player:
		return
		
	dir = (player.global_position - global_position).normalized()
	
	linear_velocity = dir * speed
	
	if global_position.distance_to(player.global_position) < .1:
		queue_free()
		
#func _died():
	##print("Snowman Parent: ", get_parent().name)
	#var parent = get_parent()
	## Play Sound Effect when killing snowman.
	#parent.emit_signal("playSound", "Pillow")


# Method is not connecting.
#func _on_body_entered(body):
	##print("body: ", body.Name)
	#print("Something collided")
	#var parent = get_parent()
	## Play Sound Effect when killing snowman.
	#parent.emit_signal("playSound", "Pillow")
	#if "weapon" in body.name:
		#_died()
	


#func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	#print("body: ", body.Name)
	#pass # Replace with function body.
