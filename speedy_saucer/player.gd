extends RigidBody2D


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	apply_force(Vector2(25,0))
