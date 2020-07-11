extends PathFollow2D

var spd = 0.001

func _process(delta):
	unit_offset += spd
	if unit_offset > 1:
		unit_offset -= 1
