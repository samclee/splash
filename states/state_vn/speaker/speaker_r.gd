extends "res://states/state_vn/speaker/speaker.gd"

func _ready():
	position.x = right_off_pos.x

func show():
	if not $VisibilityNotifier2D.is_on_screen():
		$Tween.interpolate_property(self, "position",
			right_off_pos, right_pos, slide_time, Tween.TRANS_EXPO, Tween.EASE_OUT)
		$Tween.start()

func hide():
	if $VisibilityNotifier2D.is_on_screen():
		$Tween.interpolate_property(self, "position",
			right_pos, right_off_pos, slide_time, Tween.TRANS_EXPO, Tween.EASE_IN)
		$Tween.start()

