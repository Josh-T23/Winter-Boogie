extends XRController3D

@onready var raycast = $RayCast3D
var pointed_button = null
var last_pointed_button = null

func _ready():
	# Create visual line
	var line = MeshInstance3D.new()
	var mesh = ImmediateMesh.new()
	line.mesh = mesh
	raycast.add_child(line)

func _process(_delta):
	# Draw the raycast line
	var line = raycast.get_child(0) as MeshInstance3D
	if line and line.mesh is ImmediateMesh:
		var im = line.mesh as ImmediateMesh
		im.clear_surfaces()
		im.surface_begin(Mesh.PRIMITIVE_LINES)
		im.surface_add_vertex(Vector3.ZERO)
		im.surface_add_vertex(raycast.target_position)
		im.surface_end()
	
	if not raycast:
		return
		
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider and collider.has_signal("pressed"):
			pointed_button = collider
			if pointed_button != last_pointed_button:
				pointed_button.pressed.emit()
				last_pointed_button = pointed_button
		else:
			pointed_button = null
	else:
		pointed_button = null
		last_pointed_button = null


func _on_button_pressed(name: String) -> void:
	if pointed_button != null and name == "trigger_click":
		get_tree().change_scene_to_file("res://combat.tscn")
