extends XROrigin3D
#
##var speed = 2
#var MAX_LEFT = 100.0
#var MAX_RIGHT = -100.0
#var SPEED = 3
#@onready var camera = $XRCamera3D
#@onready var left =  $Left
#@onready var right =  $Right
##
#func _process(delta: float) -> void:
	##print("Test")
	#var left_push = camera.global_position.z - left.global_position.z
	#var right_push = camera.global_position.z - right.global_position.z
	#var direction = left_push + right_push
	#if position.z + direction > MAX_LEFT and position.z + direction < MAX_RIGHT:
		#position.z += direction * delta * SPEED
