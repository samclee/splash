extends Sprite

export var use_white = false
export var initial_fade = true

const fade_in_time = 0.35
const fade_out_time = 0.1
const slow_fade_out_time = 5

const black_texture = preload("res://assets/ui/overlay.png")
const white_texture = preload("res://assets/ui/overlayw.png")

signal fade_in_done

# Called when the node enters the scene tree for the first time.
func _ready():
	if use_white:
		texture = white_texture
	if initial_fade:
		modulate.a = 255
		$Tween.interpolate_property(self, "modulate:a", 
		1, 0, fade_in_time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.interpolate_callback(self, fade_in_time, "emit_done")
		$Tween.start()


func fade_to_next_scene(scn_name):
	texture = black_texture
	$Tween.interpolate_property(self, "modulate:a", 
	0, 1, fade_out_time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.interpolate_callback(self, fade_out_time, "change_scn", scn_name)
	$Tween.start()
	
func fade_to_credits(scn_name):
	texture = white_texture
	$Tween.interpolate_property(self, "modulate:a", 
	0, 1, slow_fade_out_time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.interpolate_callback(self, slow_fade_out_time, "change_scn", scn_name)
	$Tween.start()
	
# callbacks
func change_scn(scn_name):
	get_tree().change_scene(scn_name)

func emit_done():
	emit_signal("fade_in_done")
	
# change color
