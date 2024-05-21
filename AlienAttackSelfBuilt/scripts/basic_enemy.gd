extends Area2D

@export var enemy_speed = 200

func _physics_process(delta: float) -> void:
	global_position.x -= enemy_speed * delta
	
	

func die() -> void:
	print("Basic Enemy Dying")
	queue_free()
