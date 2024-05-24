extends Path2D

@onready var path_follow = $PathFollow2D
@onready var enemy = $PathFollow2D/BasicEnemy



func _ready() -> void:
	path_follow.set_progress_ratio(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	path_follow.progress_ratio += .25 * delta
	
	var ratio = path_follow.get_progress_ratio()
	print("Ratio: " + str(ratio))
	
	if ratio >= .80:
		
		queue_free()
		
