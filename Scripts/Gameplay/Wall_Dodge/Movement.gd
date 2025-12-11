extends XROrigin3D

var MAX_LEFT = -1.9
var MAX_RIGHT = 1.9
var SPEED = 3

func _process(delta: float) -> void:
	var left_push = $XRCamera3D.global_position.x - $LeftHand.global_position.x
	var right_push = $XRCamera3D.global_position.x - $RightHand.global_position.x
	var direction = left_push + right_push
	if position.x + direction > MAX_LEFT and position.x + direction < MAX_RIGHT:
		position.x += direction * delta * SPEED
	
