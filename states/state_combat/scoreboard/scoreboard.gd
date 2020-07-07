extends Node2D

func update_player_score(num):
	var disp = str(num)
	if num < 10:
		disp = "0" + disp
		
	$player_score.text = disp
	
func update_enemy_score(num):
	var disp = str(num)
	if num < 10:
		disp = "0" + disp
		
	$enemy_score.text = disp
	
