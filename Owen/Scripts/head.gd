extends Area3D

func _on_body_entered(body: Node3D) -> void:
	if body.name.contains("Wall"):
		var score = body.get_parent().get_node("Score")
		score.score -= 5
