extends Node2D

var text
var tag

func set_text(option):
	text = option[0]
	tag = option[1]
	$Label.text = text

# activation/deactivation
func activate():
	#$Label.modulate = Color(0.0, 0.0, 0.0)
	$NinePatchRect.visible = true
	
func deactivate():
	#$Label.modulate = Color(1.0, 1.0, 1.0)
	$NinePatchRect.visible = false
