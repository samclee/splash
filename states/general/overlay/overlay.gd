extends Sprite

const fade_in_time = 0.35
const fade_out_time = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate.a = 255
	$Tween.interpolate_property(self, "modulate:a", 
	1, 0, fade_in_time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()


func fade_to_next_scene(scn_name):
	$Tween.interpolate_property(self, "modulate:a", 
	0, 1, fade_out_time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.interpolate_callback(self, fade_out_time, "change_scn", scn_name)
	$Tween.start()
	
func change_scn(scn_name):
	get_tree().change_scene(scn_name)
