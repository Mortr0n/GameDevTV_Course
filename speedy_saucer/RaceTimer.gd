extends Label


@onready var race_timer: Label = $"."
@export var last_time = 0.00
@export var time_elapsed := 0.0


func _process(delta: float) -> void:
	time_elapsed += delta
	race_timer.text = str("%2.2f" % time_elapsed)
