extends RigidBody3D

@export var speed = 5.0
@export var dir = Vector3(0, 0, 1)
@export var player: Node3D
@onready var groanEffect = $%GroanEffect

#signal snowman_died
#
func _ready():
	if not groanEffect.playing and randi_range(0, 1) == 1:
		groanEffect.play()

func _physics_process(delta):
	if not player:
		return

	dir = (player.global_position - global_position).normalized()
	
	linear_velocity = dir * speed
	
	if global_position.distance_to(player.global_position) < .1:
		var combat_node = get_tree().current_scene
		combat_node.snowman_hit()
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
