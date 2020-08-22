extends Node2D

var move_credits = false
var can_skip = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var save_data = dlm.load_save()

func _input(event):
	if event.is_action_pressed("primary") and can_skip:
		$overlay.fade_to_next_scene("res://states/state_title/state_title.tscn")
		Aum.fade_out_song()

func _process(delta):
	if move_credits:
		$Node2D.position.y -= 1
	can_skip = $Node2D.position.y < -350

func _on_Timer_timeout():
	move_credits = true
