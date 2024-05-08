extends CharacterBody2D

var max_speed = 300
var min_x = 0
var min_y = 0
var ship_x_buffer = 50

func _physics_process(delta: float) -> void:
	var vertical_direction = 0
	var horizontal_direction = 0
	
	if Input.is_action_pressed("move_up"):
		vertical_direction = -1
	if Input.is_action_pressed("move_down"):
		vertical_direction = 1
	if Input.is_action_pressed("move_right"):
		horizontal_direction = 1
	if Input.is_action_pressed("move_left"):
		horizontal_direction = -1
		
	velocity = Vector2(horizontal_direction * max_speed, vertical_direction * max_speed)
	move_and_slide()
	
	var screen_size = get_viewport_rect().size
	
	if global_position.x < min_x:
		global_position.x = min_x
	if global_position.y < min_y:
		global_position.y = min_y
	if global_position.x > screen_size.x - ship_x_buffer:
		global_position.x = screen_size.x - ship_x_buffer
	if global_position.y > screen_size.y:
		global_position.y = screen_size.y
		
	print(global_position)
