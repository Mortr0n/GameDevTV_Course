extends Node2D

func _ready() -> void:
	pass


func _on_maze_body_exited(body: Node2D) -> void:
	get_tree().reload_current_scene()



