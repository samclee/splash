extends Node2D

export var spd = 0.005

var options

func _ready():
	options = $options.get_children()
	$Path2D/cursor.spd = spd
	
func _input(event):
	pass

func activate():
	visible = true
		
func deactivate():
	visible = false
	
func get_selected_tag():
	var closest_option_name = null
	for o in options:
		if o.selected:
			closest_option_name = o.name
			
	if closest_option_name:
		return($options.get_node(closest_option_name).tag)
	else:
		return null
