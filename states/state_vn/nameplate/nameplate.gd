extends Node2D

func _ready():
	hide()

func hide():
	visible = false
	
func show():
	visible = true
	
func set_side(xpos):
	position.x = xpos
	
func set_name(name):
	$Label.text = name
