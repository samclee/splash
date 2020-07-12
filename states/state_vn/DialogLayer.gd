extends CanvasLayer

const slide_time = 0.5

func _ready():
	slide_up()


func slide_down():
	$Tween.interpolate_property(self, "offset:y",
		0, 300, 0.3, Tween.TRANS_LINEAR)
	$Tween.start()
	
func slide_up():
	$Tween.interpolate_property(self, "offset:y",
		300, 0, slide_time, Tween.TRANS_EXPO, Tween.EASE_OUT)
	$Tween.start()
