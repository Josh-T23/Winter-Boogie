extends XRController3D

var weapon = null
var weapon_name = null

func _ready() -> void:
	weapon_name = str(Global.weapon)
	weapon_name = normalize_name(weapon_name)
	weapon = load("res://weapons/" + str(weapon_name) + ".tscn").instantiate()
	add_child(weapon)
	var area = weapon.get_node("Area3D")
	var col = area.get_node("CollisionShape3D")
	col.name += "_weapon"
	
func normalize_name(text: String) -> String:
	return text.to_lower().replace(" ", "_")
