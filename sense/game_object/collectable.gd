extends Area2D

@onready var game_manager: Node = get_node("/root/Node/GameManager")


func _on_body_entered(body):
	if (body.name == "CharacterBody2D"):
			queue_free()
			game_manager.add_point()
