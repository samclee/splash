extends Node2D

export(String, FILE, "*.tscn") var next_scn_path
export(String, FILE, "*.tscn") var maybe_next_scn_path
export var is_unwinnable = false
export var maybe_winnable = false

const WIN_NUM = 4

var player_score = 0
var enemy_score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# called by signals
func player_point_scored():
	player_score += 1
	if player_score == WIN_NUM - 1 and is_unwinnable:
		enemy_overdrive()
	elif player_score >= WIN_NUM:
		all_stop()
		activate_continue(next_scn_path)

func enemy_point_scored():
	enemy_score += 1
	if enemy_score >= WIN_NUM:
		all_stop()
		if is_unwinnable:
			activate_continue(next_scn_path)
		elif maybe_winnable:	
			activate_continue(maybe_next_scn_path)
		else:
			activate_retry()
	
	
# flow control
func activate_continue(scn_name):
	$combat_end_card.activate(scn_name, "Continue")
	
func activate_retry():
	$combat_end_card.activate(null, "Retry")
	
func next_scene():
	pass
	
func retry():
	pass
	
# ui
func update_scoreboard():
	pass
	
# status control
func enemy_overdrive():
	var enemies = $enemies.get_children()
	for e in enemies:
		e.overdrive()
	
func enemy_stop():
	var enemies = $enemies.get_children()
	for e in enemies:
		e.stop()

func player_stop():
	var athletes = $player/athletes.get_children()
	for a in athletes:
		a.can_get_hit = false
		
	$player.MAX_SPD = 0
	
func all_stop():
	player_stop()
	enemy_stop()
	
# callbacks
