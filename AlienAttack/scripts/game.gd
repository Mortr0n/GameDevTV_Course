extends Node2D

const GAME_OVER_SCREEN = preload("res://scenes/game_over_screen.tscn")
@export var player_lives = 3
@onready var player = $Player
@onready var hud = $UI/HUD
@onready var enemy_hit_sound = $EnemyHitSound
@onready var player_died_sound = $PlayerDiedSound


var score = 0



func _ready() -> void:
	hud.set_score_label(score)
	hud.set_lives_label(player_lives)

func _on_death_zone_area_entered(area: Area2D) -> void:
	area.queue_free()


func _on_player_took_damage() -> void:
	player_lives -= 1
	hud.set_lives_label(player_lives)
	if player_lives == 0:
		print("Player dead!")
		player_died_sound.play()
		player.die()
		
		await get_tree().create_timer(1.5).timeout
		
		var game_over_instance = GAME_OVER_SCREEN.instantiate()
		game_over_instance.set_score(score)
		# I also was able to center it this commented out way, but it's not a child of the hud if I just add the child so then I did the hud.add_child
		#game_over_instance.global_position = Vector2(global_position.x + 640, global_position.y + 360 ) 
		hud.add_child(game_over_instance)
	else:
		print("lives = " + str(player_lives))
		

func _on_enemy_died():
	enemy_hit_sound.play()
	print("Enemy died in game! ")
	score += 100
	print("Score:" + str(score))
	hud.set_score_label(score)



func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
# signal we made inside basic_enemy called enemy_died.  then we make the function _on_enemy_died which we connect in this line
	enemy_instance.connect("enemy_died", _on_enemy_died)
	add_child(enemy_instance)
	
