extends Node2D

export var spd = 0.005

var options

func _ready():
	options = $options.get_children()
	$Path2D/cursor.spd = spd
	
func start():
	$Path2D/cursor.start()
	
func stop():
	$Path2D/cursor.stop()
	
func get_selected_tag():
	var closest_option_name = null
	for o in options:
		if o.selected == true:
			closest_option_name = o.name
	if closest_option_name:
		return($options.get_node(closest_option_name).tag)
	else:
		return null
