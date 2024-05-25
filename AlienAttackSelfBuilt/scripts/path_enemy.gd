extends Path2D

@onready var path_follow_2d: PathFollow2D = $PathFollow2D
@onready var basic_enemy: Area2D = $PathFollow2D/BasicEnemy


func _ready() -> void:
	path_follow_2d.set_progress_ratio(1)
	

func _process(delta: float) -> void:
	path_follow_2d.progress_ratio -= .15 * delta
	#print("Progress ratio " + str(path_follow_2d.progress_ratio))
	#print("Enemy global position " + str(basic_enemy.global_position))
	if path_follow_2d.progress_ratio <= 0:
		queue_free()
