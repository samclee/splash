extends "res://states/state_vn/speaker/speaker.gd"

func _ready():
	position.x = left_off_pos.x

func show():
	if not $VisibilityNotifier2D.is_on_screen():
		$Tween.interpolate_property(self, "position",
			left_off_pos, left_pos, slide_time, Tween.TRANS_EXPO, Tween.EASE_OUT)
		$Tween.start()

func hide():
	if $VisibilityNotifier2D.is_on_screen():
		$Tween.interpolate_property(self, "position",
			left_pos, left_off_pos, slide_time, Tween.TRANS_EXPO, Tween.EASE_IN)
		$Tween.start()

func ahide():
	if $VisibilityNotifier2D.is_on_screen():
		$Tween.interpolate_property(self, "position",
			left_pos, right_off_pos, slide_time, Tween.TRANS_EXPO, Tween.EASE_IN)
		$Tween.start()
		
func bump():
	$Tween.interpolate_property(self, "position", left_pos, left_pos + Vector2(100, 0),
		0.1, Tween.TRANS_LINEAR)
	$Tween.start()
	yield($Tween, "tween_completed")
	$Tween.interpolate_property(self, "position", null, left_pos,
		0.1, Tween.TRANS_LINEAR)
	$Tween.start()
