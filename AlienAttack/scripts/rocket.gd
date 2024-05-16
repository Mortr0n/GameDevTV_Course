extends Area2D

@export var rocket_speed = 300

@onready var visible_notifier: VisibleOnScreenNotifier2D = $VisibleNotifier


func _ready() -> void: 
	#connecting the visiblenotifier's screen exited signal to our rocket via code instead of clicking the signal and doing it that way.
	visible_notifier.connect("screen_exited", _on_screen_exited)

func _physics_process(delta: float) -> void:
	global_position.x += rocket_speed * delta

func _on_screen_exited():
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	queue_free()
	area.die()
# you could just call queue free on the area that entered the rocket area, but then you won't be able to do additional stuff on that item.
# It's better instead to make a separate function for that item so that you can do other things like maybe call an animation or something
	#area.queue_free()
