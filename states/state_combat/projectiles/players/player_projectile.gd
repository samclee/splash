extends Area2D

var spd = 10

func _ready():
	add_to_group("PlayerProjectile")

func _process(delta):
	position.x += spd
	
	if position.x > 1000 + $Sprite.texture.get_width() / 2:
		queue_free()

func explode():
	queue_free()
