extends Node2D

const ENEMY_SCENE = preload("res://scenes/basic_enemy.tscn")
@onready var spawn_positions_container: Node2D = $SpawnPositions
@onready var timer: Timer = $Timer
@export var timer_wait_time = 2

signal enemy_spawned(enemy_instance)

func _ready():
	timer.wait_time = timer_wait_time
	timer.autostart = true
	

func spawn_enemy():
	#print("enemy spawning")
	var enemy_instance = ENEMY_SCENE.instantiate()
	var spawn_positions = spawn_positions_container.get_children()
	var spawn_position = spawn_positions.pick_random()
	
	emit_signal("enemy_spawned", enemy_instance)
	enemy_instance.global_position = spawn_position.global_position
	#print(enemy_instance.global_position)
	#add_child(enemy_instance) remove this code after getting signal set to add child in game script


func _on_timer_timeout() -> void:
	spawn_enemy()
	

