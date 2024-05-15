extends Node2D

var enemy = preload("res://scenes/basic_enemy.tscn")


func _on_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy():
	var enemy_instance = enemy.instantiate()
	var spawn_pos_parent = self.get_children()[0]
	#var first_child = self.
	var spawners = spawn_pos_parent.get_children()

	var rng = RandomNumberGenerator.new()
	var r_num = rng.randi_range(0,5)
	spawners[r_num].add_child(enemy_instance)
