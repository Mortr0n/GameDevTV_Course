extends Area2D
@export var rocket_speed = 250

func _ready():
	pass

func _physics_process(delta: float) -> void:

	global_position.x += delta * rocket_speed



func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	queue_free()
	area.die()
