extends Area2D

@export var rocket_speed = 300

@onready var visible_notifier: VisibleOnScreenNotifier2D = $VisibleNotifier


func _ready() -> void:
	visible_notifier.connect("screen_exited", _on_screen_exited)

func _physics_process(delta: float) -> void:
	global_position.x += rocket_speed * delta

func _on_screen_exited():
	#print("Rockets Red Glare")
	queue_free()
