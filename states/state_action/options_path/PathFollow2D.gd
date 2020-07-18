extends PathFollow2D

var spd = 0.001
var moving = true

func _ready():
	pass

func _process(delta):
	if moving:
		unit_offset += spd
		if unit_offset > 1:
			unit_offset -= 1


func start():
	moving = true

func stop():
	moving = false


func _on_Area2D_area_entered(area):
	$Sprite.frame = 1
	

func _on_Area2D_area_exited(area):
	$Sprite.frame = 0
