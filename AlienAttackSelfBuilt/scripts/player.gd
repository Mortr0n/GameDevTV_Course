extends CharacterBody2D


@onready var rocket_container = $RocketContainer
@export var max_speed = 300

var rocket_scene = preload("res://scenes/rocket.tscn")

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * max_speed
	
	var viewport_rect = get_viewport_rect()	
	global_position = global_position.clamp(viewport_rect.position, viewport_rect.size)

func shoot():
	var rocket_instance = rocket_scene.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 60
