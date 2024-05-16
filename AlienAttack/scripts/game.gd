extends Node2D


@export var player_lives = 3
@onready var player = $Player



var score = 0


func _on_death_zone_area_entered(area: Area2D) -> void:
	area.die()


func _on_player_took_damage() -> void:
	player_lives -= 1
	
	if player_lives == 0:
		print("Player dead!")
		player.die()
	else:
		print("lives = " + str(player_lives))




