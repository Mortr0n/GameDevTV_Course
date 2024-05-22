extends Area2D

@export var enemy_speed = 200
@export var enemy_score_value = 100

signal enemy_died(enemy_instance)


func _physics_process(delta: float) -> void:
	global_position.x -= enemy_speed * delta
	
	

func die() -> void:
	print("Basic Enemy Dying")
	emit_signal("enemy_died", self)
	queue_free()


# when player is entered which is characterbody2d
func _on_body_entered(body: Node2D) -> void:
	body.player_damaged()
