extends CharacterBody2D


@export var max_speed = 300


func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	
	
	
func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * max_speed
	
	var viewport_rect = get_viewport_rect()	
	global_position = global_position.clamp(viewport_rect.position, viewport_rect.size)
