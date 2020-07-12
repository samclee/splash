extends Node2D

export var text = ""
export var tag = ""

var cursor_ref
var selected = true

func _ready():
	assert(text != "")
	$wrapper/offset_wrapper/Label.text = text
	assert(tag != "")
	cursor_ref = get_parent().get_parent().get_node("Path2D/cursor")
	assert(cursor_ref)
	var off_r = $wrapper/offset_wrapper/Label.margin_right / 2
	var off_b = $wrapper/offset_wrapper/Label.margin_bottom / 2
	$wrapper/offset_wrapper.position = Vector2(-off_r, -off_b)
	
	
func _process(delta):
	if global_position.distance_to(cursor_ref.global_position) < 100:
		activate()
	else:
		deactivate()

func activate():
	selected = true
	scale = Vector2(1.2, 1.2)
	$wrapper.rotation_degrees = 20
	
func deactivate():
	selected = false
	scale = Vector2(1, 1)
	$wrapper.rotation_degrees = 0
