extends Path2D

@onready var path_follow = $PathFollow2D
@onready var enemy = $PathFollow2D/BasicEnemy



func _ready() -> void:
	path_follow.set_progress_ratio(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	path_follow.progress_ratio += .25 * delta
	
	var ratio = path_follow.get_progress_ratio() # OMG it won't go to greater than like .85 most of the time so make it extra long and then queue free at like 80% or something like that or do like they 
	print("Ratio: " + str(ratio))
	
	if ratio >= .80:
		
		queue_free()
		
