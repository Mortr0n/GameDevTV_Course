extends Node2D


@export var player_lives = 3
@onready var player = $Player
@onready var hud = $UI/HUD
var score = 0



func _ready() -> void:
	hud.set_score_label(score)
	hud.set_lives_label(player_lives)

func _on_death_zone_area_entered(area: Area2D) -> void:
	area.die()


func _on_player_took_damage() -> void:
	player_lives -= 1
	hud.set_lives_label(player_lives)
	if player_lives == 0:
		print("Player dead!")
		player.die()
	else:
		print("lives = " + str(player_lives))
		

func _on_enemy_died():
	print("Enemy died in game! ")
	score += 100
	print("Score:" + str(score))
	hud.set_score_label(score)



func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
# signal we made inside basic_enemy called enemy_died.  then we make the function _on_enemy_died which we connect in this line
	enemy_instance.connect("enemy_died", _on_enemy_died)
	add_child(enemy_instance)
	
