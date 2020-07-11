extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	slide_up()


func slide_down():
	$Tween.interpolate_property(self, "offset:y",
		0, 300, 0.4, Tween.TRANS_LINEAR)
	$Tween.start()
	
func slide_up():
	$Tween.interpolate_property(self, "offset:y",
		300, 0, 0.4, Tween.TRANS_LINEAR)
	$Tween.start()
