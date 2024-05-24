extends Node2D

const PATH_ENEMY_SCENE = preload("res://scenes/path_enemy.tscn")
var enemy_scene = preload("res://scenes/basic_enemy.tscn")
@onready var spawn_position_container: Node2D = $SpawnPositions
@onready var spawn_positions = spawn_position_container.get_children()

signal enemy_spawned(enemy_instance) # this enemy_spawned signal requires an enemy_instance as the argument
signal path_enemy_spawned(path_enemy_instance)

func _on_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy():
	var enemy_instance = enemy_scene.instantiate()
	#var spawn_positions = spawn_position_container.get_children() # I added the spawn_positions to the onready vars and it seems to work fine
	var random_spawner = spawn_positions.pick_random()
	
	enemy_instance.global_position = random_spawner.global_position
	emit_signal("enemy_spawned", enemy_instance) # emitting signal enemy spawned taking in the enemy_instance we instantiated as the argument
	#add_child(enemy_instance)
	
# I'm not sure that there's is better than my way, but there's more ways than one to do it.
	#var spawners = spawn_positions.get_children()
	#var rng = RandomNumberGenerator.new()
	#var r_num = rng.randi_range(0,5)
	#spawners[r_num].add_child(enemy_instance)


func _on_path_enemy_timer_timeout() -> void:
	
	spawn_path_enemy()
	

func spawn_path_enemy():
	var path_enemy_instance = PATH_ENEMY_SCENE.instantiate()
	var random_spawner = spawn_positions.pick_random()
	path_enemy_instance.global_position = global_position
	print("Enemy spawned at " + str(path_enemy_instance.global_position))
	emit_signal("path_enemy_spawned", path_enemy_instance)
	
	# They do this very differently than I did They instead make a path_enemy_spawned signal and pass the path_enemy.  I wanted to leave this for my learning at another way I made this happen on my own.
	#emit_signal("enemy_spawned", path_enemy_instance) # this makes the entire path_follow enemy appear, but won't have the sound or score I pass	
	#var path_follow = path_enemy_instance.get_child(0)
	#var enemy = path_follow.get_child(0)
	#emit_signal("enemy_spawned", enemy) # this will include the score that gets passed.  It's a grandchild node so hence all the get_child(0) stuff.  It will not spawn the whole enemy since it's just the basic_enemy part of it
	#print(path_enemy_instance.get_children(0))	
	#print(enemy)
