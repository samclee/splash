extends Camera2D


var shake_vec
var shaking = false


# Called when the node enters the scene tree for the first time.
func _ready():
	shake_vec = Vector2.RIGHT * 10
	
func _process(delta):
	if shaking:
		var angle = randi() % 360
		shake_vec = shake_vec.rotated(deg2rad(angle))
		offset = shake_vec


func shake():
	$Timer.start(0.4)
	shaking = true

func _on_Timer_timeout():
	shaking = false
	offset = Vector2.ZERO
