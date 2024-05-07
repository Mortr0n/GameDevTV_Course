extends Node2D



@onready var last_time: Label = $Graphics/CanvasLayer/LastTime
@onready var race_timer: Label = $Graphics/CanvasLayer/RaceTimer


@export var level_time = 0.00

func _ready() -> void:
	pass



func _on_maze_body_exited(body: Node2D) -> void:
	#level_time = race_timer.time_elapsed
	#last_time.last_time = level_time
	#print(last_time.last_time)
	#last_time.last_time = last_time
	get_tree().reload_current_scene()



