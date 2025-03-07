extends CollisionShape2D




func _on_fall_body_entered(body):
	if (body.name == "CharacterBody2D"):
		get_tree().reload_current_scene()
