extends Node2D

@onready var player: CharacterBody2D = $Player

var score = 0
var player_lives = 3


func _on_death_zone_area_entered(area: Area2D) -> void:
	area.die()



func _on_player_player_hit() -> void:
	if player_lives > 1:
		player_lives -= 1
		print("Player Lives: " + str(player_lives))
	else:
		player_lives -= 1
		player.die()
	

func _on_enemy_died(enemy_instance):
	score += enemy_instance.enemy_score_value
	print("Score: " + str(score))

func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
	enemy_instance.connect("enemy_died",  Callable(self, "_on_enemy_died"), 0)
	add_child(enemy_instance)
