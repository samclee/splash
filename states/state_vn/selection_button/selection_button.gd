extends Node2D

var jump_label

func init(text, jump_label):
	$Label.text = text
	self.jump_label = jump_label
	deactivate()

# activation/deactivation
func activate():
	$NinePatchRect.visible = true
	
func deactivate():
	$NinePatchRect.visible = false
