extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var hud: Control = $UI/HUD

var score = 0
var player_lives = 3

func _ready() -> void:
	hud.set_score_label(score)
	hud.set_lives_left_label(player_lives)

func _on_death_zone_area_entered(area: Area2D) -> void:
	area.die()



func _on_player_player_hit() -> void:
	if player_lives > 1:
		player_lives -= 1
		print("Player Lives: " + str(player_lives))
		hud.set_lives_left_label(player_lives)
	else:
		player_lives -= 1
		hud.set_lives_left_label(player_lives)
		player.die()
	

func _on_enemy_died(enemy_instance):
	score += enemy_instance.enemy_score_value # I added that the score for each enemy is contained in that node so that each one could pass their individual scores or whatever.  Also good practice for signals and connections.
	print("Score: " + str(score))
	hud.set_score_label(score)
	

func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
	enemy_instance.connect("enemy_died",  Callable(self, "_on_enemy_died"), 0) 
	add_child(enemy_instance)
