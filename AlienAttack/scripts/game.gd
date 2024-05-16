extends Node2D

@export var player_lives = 3




func _on_death_zone_area_entered(area: Area2D) -> void:
	area.die()
