extends Control

@onready var score: Label = $Score
@onready var lives_left: Label = $LivesLeft

func set_score_label(new_score):
	score.text = "Score:" +str(new_score)
	
func set_lives_left_label(new_lives_left):
	lives_left.text = str(new_lives_left)
