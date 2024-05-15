extends Area2D

@onready var visible_notifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

@export var move_speed = 200

func _physics_process(delta: float) -> void:
	global_position.x -= move_speed * delta


# this became invalid when they decided to make a collision shape and use it to queue_free the ship.
# I'm not sure on the pro's and cons for either way
# did this by clicking in the node signals, but you can also code these up.  See Rocket code for hand coded one
#func _on_visible_notifier_screen_exited() -> void:
	##queue_free()
	#pass
	
func die() -> void:
	print("dying!")
	queue_free()
