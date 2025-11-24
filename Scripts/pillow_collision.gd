extends Area3D

func _on_body_entered(body):
	body.emit_signal("snowman_died")
	body.queue_free()
	#pillowAudio.play()
	#print("Snowman colliding!")
	#print("Pilliow Collided with: ", body)
