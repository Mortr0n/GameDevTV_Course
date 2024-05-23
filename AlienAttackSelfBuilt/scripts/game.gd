extends Node2D

const GAME_OVER_SCREEN_CONTROL = preload("res://scenes/game_over_screen_control.tscn")
@onready var player: CharacterBody2D = $Player
@onready var hud: Control = $UI/HUD
@onready var enemy_died_sound: AudioStreamPlayer = $EnemyDiedSound
@onready var player_died_sound: AudioStreamPlayer = $PlayerDiedSound


var score = 0
var player_lives = 3

func _ready() -> void:
	hud.set_score_label(score)
	hud.set_lives_left_label(player_lives)

func _on_death_zone_area_entered(area: Area2D) -> void:
	area.queue_free()



func _on_player_player_hit(area: Area2D) -> void:
	# I had to do the enemy_scoring weird because I get the score from the enemy. 
	player_died_sound.play()
	#print("score val: " + str(area.enemy_score_value))
	score += area.enemy_score_value
	hud.set_score_label(score)
	if player_lives > 1:
		player_lives -= 1
		print("Player Lives: " + str(player_lives))
		hud.set_lives_left_label(player_lives)
	else:
		player_lives -= 1
		hud.set_lives_left_label(player_lives)
		player.die()
		#player_died_sound.play()
		await get_tree().create_timer(1.5).timeout
		
		var game_over_instance = GAME_OVER_SCREEN_CONTROL.instantiate()
		game_over_instance.set_score(score)
		hud.add_child(game_over_instance)
	

func _on_enemy_died(enemy_instance):
	score += enemy_instance.enemy_score_value # I added that the score for each enemy is contained in that node so that each one could pass their individual scores or whatever.  Also good practice for signals and connections.
	print("Score: " + str(score))
	hud.set_score_label(score)
	enemy_died_sound.play()
	#enemy_instance.queue_free()
	

func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
	enemy_instance.connect("enemy_died",  Callable(self, "_on_enemy_died"), 0) 
	add_child(enemy_instance)
