extends XRController3D

var weapon = null
var weapon_name = null

# This is used for weapon switching.
func _ready() -> void:
	weapon_name = str(Global.weapon)
	weapon_name = normalize_name(weapon_name)
	weapon = load("res://Prefabricated/Weapons/" + str(weapon_name) + ".tscn").instantiate()
	add_child(weapon)
	var area = weapon.get_node("Area3D")
	var col = area.get_node("CollisionShape3D")
	col.name += "_weapon"
	
func normalize_name(text: String) -> String:
	return text.to_lower().replace(" ", "_")
	
#func _process(delta):
	#print(weapon_name)
	#if Input.is_action_pressed("trigger_click") and weapon_name == "snowball_cannon":
		#print("Trigger clicked!")


func _on_button_pressed(name):
	if name == "trigger_click" and weapon_name == "snowball_cannon":
		var bullet = load("res://Prefabricated/Weapons/snowball.tscn").instantiate()
		var rootScene = get_tree().root.get_child(1)
		rootScene.add_child(bullet)
		bullet.global_position = global_position
		var forward = -global_transform.basis.z
		bullet.linear_velocity = forward * 20.0
		rootScene.emit_signal("playSound", "Cannon")
		
		#print("Trigger clicked!")
