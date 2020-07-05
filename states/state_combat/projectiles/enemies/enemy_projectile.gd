extends Area2D

var spd = 1

func _ready():
	add_to_group("EnemyProjectile")

func _process(delta):
	position.x -= spd
	
	if position.x < $Sprite.texture.get_width() / -2:
		queue_free()

func explode():
	queue_free()
