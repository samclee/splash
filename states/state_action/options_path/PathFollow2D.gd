extends PathFollow2D

var spd = 0.001

var options

func _ready():
	options = get_parent().get_parent().get_node("options").get_children()

func _process(delta):
	unit_offset += spd
	if unit_offset > 1:
		unit_offset -= 1
	
	var close = false
	for o in options:
		if global_position.distance_to(o.global_position) < 100:
			close = true
			
	if close:
		$Sprite.frame = 1
	else:
		$Sprite.frame = 0
