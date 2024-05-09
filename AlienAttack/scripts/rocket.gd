extends Area2D

@export var rocket_speed = 300

func _physics_process(delta: float) -> void:
	global_position.x += rocket_speed * delta
