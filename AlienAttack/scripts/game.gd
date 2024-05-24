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
	

# able to get the enemy instance from the path_enemy_instance and connect the signal while still adding the path_enemy_instance as a child of the spawner
func _on_enemy_spawner_path_enemy_spawned(path_enemy_instance: Variant) -> void:
	add_child(path_enemy_instance) # change order if your connecting straight from the path_enemy_instance.enemy that we got a reference to in the path_enemy scene because the enemy reference is an onready var which isn't ready until the child has been added.
	path_enemy_instance.enemy.connect("enemy_died", _on_enemy_died)
	
	# This is how I did this on my own for part 2.  I got references to each child to get to the grandchild then pass it and then acc the path_enemy_instance child.
	#var path_follow_instance = path_enemy_instance.get_child(0)
	#var enemy_instance = path_follow_instance.get_child(0)
	#enemy_instance.connect("enemy_died", _on_enemy_died)
	#add_child(path_enemy_instance)
