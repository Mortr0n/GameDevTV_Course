extends Node2D

var enemy = preload("res://scenes/basic_enemy.tscn")
@onready var spawn_pos_01: Marker2D = $SpawnPositions/SpawnPos_01
@onready var spawn_pos_02: Marker2D = $SpawnPositions/SpawnPos_02
@onready var spawn_pos_03: Marker2D = $SpawnPositions/SpawnPos_03
@onready var spawn_pos_04: Marker2D = $SpawnPositions/SpawnPos_04
@onready var spawn_pos_05: Marker2D = $SpawnPositions/SpawnPos_05
@onready var spawn_pos_06: Marker2D = $SpawnPositions/SpawnPos_06


func _on_timer_timeout() -> void:
	var enemy_instance = enemy.instantiate()
	var e_s_children = self.get_children()
	var spawners = e_s_children[0].get_children()
	
	#var spawn_string = "spawn_pos_0"
	var rng = RandomNumberGenerator.new()
	var r_num = rng.randi_range(0,5)
	spawners[r_num].add_child(enemy_instance)
	#spawn_string += str(r_num)
	#print(spawn_string)
	#spawn_string.add_child(enemy_instance)
	
