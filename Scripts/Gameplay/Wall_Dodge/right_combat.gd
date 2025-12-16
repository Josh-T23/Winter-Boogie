extends XRController3D


@onready var origin = $%XROrigin3D
var MAX_FORWARD = -50.0
var MAX_BACKWARD = 50.0
var MAX_LEFT = -50.0
var MAX_RIGHT = 50.0
#var SPEED = 3
@onready var left =  $%Left
@onready var right =  $%Right
var coordinate = 0.0

var baseSpeed = 3

var timer = 1

var weapon = null
var weapon_name = null


# This is used for weapon switching.
func _ready() -> void:
	coordinate = position.y
	weapon_name = str(Global.weapon)
	weapon_name = normalize_name(weapon_name)
	weapon = load("res://Prefabricated/Weapons/" + str(weapon_name) + ".tscn").instantiate()
	add_child(weapon)
	var area = weapon.get_node("Area3D")
	var col = area.get_node("CollisionShape3D")
	col.name += "_weapon"
	
func _physics_process(delta):
	#print("Test")
	if origin and left and right:
		print("Origin: ", origin.global_position)
		var left_push = origin.global_position.z - left.global_position.z
		var right_push = origin.global_position.z - right.global_position.z
		var direction = left_push + right_push
	# and position.z + direction < MAX_RIGHT
#	Boundaries for front and back
		if origin.global_position.z + direction <= MAX_FORWARD:
			#print("This is activating")
			origin.global_position.z += delta * 100
		if origin.global_position.z + direction >= MAX_BACKWARD:
			origin.global_position.z -= delta * 100
#			#	Boundaries for left and right
		if origin.global_position.x + direction <= MAX_LEFT:
			#print("This is activating")
			origin.global_position.x += delta * 100
		if origin.global_position.x + direction >= MAX_RIGHT:
			origin.global_position.x -= delta * 100
		
	
func _process(delta):
	# BODY-FACING MOVEMENT

	var forward = -origin.global_transform.basis.z
	forward.y = 0.0
	forward = forward.normalized()

	var left = origin.global_transform.basis.x
	left.y = 0.0
	left = left.normalized()
	

	# Now compute a "move_vec"
	var move_vec = Vector3.ZERO
	
	# Strafe to the left.
	if is_button_pressed("grip_click"):
		var velocity = position.y - coordinate
		if (velocity * 100 > 0.1) or (velocity * 100 < -0.25):
			if velocity < 0: velocity = -velocity
			move_vec += left * velocity
			if move_vec != Vector3.ZERO:
				origin.global_position += move_vec.normalized() * baseSpeed * delta
		coordinate = position.y

	# Forward/backward from controller movement
	if is_button_pressed("ax_button"):
		var velocity = position.y - coordinate
		if (velocity * 100 > 0.1) or (velocity * 100 < -0.25):
			if velocity < 0: velocity = -velocity
			move_vec += forward * velocity
			if move_vec != Vector3.ZERO:
				origin.global_position += move_vec.normalized() * baseSpeed * delta
		coordinate = position.y

	elif is_button_pressed("by_button"):
		var velocity = position.y - coordinate
		#print("velocity: ", velocity * 100)
		if (velocity * 100 > 0.1) or (velocity * 100 < -0.25):
			if velocity < 0: velocity = -velocity
			move_vec -= forward * velocity
			# ------------------------------
			# APPLY MOVEMENT (this is identical to PC)
			# ------------------------------
			if move_vec != Vector3.ZERO:
				origin.global_position += move_vec.normalized() * baseSpeed * delta
		coordinate = position.y

	else:
		coordinate = position.y
	
func normalize_name(text: String) -> String:
	return text.to_lower().replace(" ", "_")
	
#func _process(delta):
	#print(weapon_name)
	#if Input.is_action_pressed("trigger_click") and weapon_name == "snowball_cannon":
		#print("Trigger clicked!")


func _on_button_pressed(name):
	if name == "trigger_click":
		if weapon_name == "snowball_cannon":
			var bullet = load("res://Prefabricated/Weapons/snowball.tscn").instantiate()
			var rootScene = get_tree().root.get_child(1)
			rootScene.add_child(bullet)
			bullet.global_position = global_position
			var forward = -global_transform.basis.z
			bullet.linear_velocity = forward * 20.0
			rootScene.emit_signal("playSound", "Cannon")
		if weapon_name == "pillow":
			var bullet = load("res://Prefabricated/Weapons/throwable_pillow.tscn").instantiate()
			var rootScene = get_tree().root.get_child(1)
			rootScene.add_child(bullet)
			bullet.global_position = global_position
			var forward = -global_transform.basis.z
			bullet.linear_velocity = forward * 10.0
		
		#print("Trigger clicked!")
