extends Control

@onready var score = $Score
@onready var lives_left = $LivesLeftLabel


func set_score_label(new_score):
	score.text = "Score:" + str(new_score)
	

func set_lives_label(new_lives):
	lives_left.text = str(new_lives)
