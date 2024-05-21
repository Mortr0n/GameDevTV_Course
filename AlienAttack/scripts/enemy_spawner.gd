extends Node2D


var enemy_scene = preload("res://scenes/basic_enemy.tscn")
@onready var spawn_position_container: Node2D = $SpawnPositions

signal enemy_spawned(enemy_instance) # this enemy_spawned signal requires an enemy_instance as the argument

func _on_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy():
	var enemy_instance = enemy_scene.instantiate()
	var spawn_positions = spawn_position_container.get_children()
	var random_spawner = spawn_positions.pick_random()
	
	enemy_instance.global_position = random_spawner.global_position
	emit_signal("enemy_spawned", enemy_instance) # emitting signal enemy spawned taking in the enemy_instance we instantiated as the argument
	#add_child(enemy_instance)
	
# I'm not sure that there's is better than my way, but there's more ways than one to do it.
	#var spawners = spawn_positions.get_children()
	#var rng = RandomNumberGenerator.new()
	#var r_num = rng.randi_range(0,5)
	#spawners[r_num].add_child(enemy_instance)
