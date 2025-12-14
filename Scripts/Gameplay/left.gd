extends XRController3D

@onready var origin = $%XROrigin3D
var coordinate = 0.0

var baseSpeed = 3

var timer = 1.0

func _process(delta):
	# SNAP TURN USING CONTROLLER TILT
	if timer > 0.0:
		timer -= delta

	#var rotate_degs = global_rotation_degrees
	## rotate to left.
	#if rotate_degs.z >= 45.0 and timer <= 0.0:
		#timer = 1.0
		#origin.rotate_y(deg_to_rad(45.0))
#
	## rotate to right
	#if rotate_degs.z <= -45.0 and timer <= 0.0:
		#timer = 1.0
		## EXACT PC equivalence: rotation_degrees.y -= 1
		## VR-SAFE VERSION:
		#origin.rotate_y(deg_to_rad(-45.0))

	# BODY-FACING MOVEMENT

	var forward = -origin.global_transform.basis.z
	forward.y = 0.0
	forward = forward.normalized()


	var right = origin.global_transform.basis.x
	right.y = 0.0
	right = right.normalized()

	# Now compute a "move_vec" just like PC:
	var move_vec = Vector3.ZERO
	
	# Strafe to the right.
	if is_button_pressed("grip_click"):
		var velocity = position.y - coordinate
		if (velocity * 100 > 0.1) or (velocity * 100 < -0.25):
			if velocity < 0: velocity = -velocity
			move_vec -= right * velocity
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
		if (velocity * 100 > 0.1) or (velocity * 100 < -0.25):
			if velocity < 0: velocity = -velocity
			move_vec -= forward * velocity
			
			if move_vec != Vector3.ZERO:
				origin.global_position += move_vec.normalized() * baseSpeed * delta
		coordinate = position.y

	else:
		coordinate = position.y
