extends Node2D

export var tag = ""

var cursor_ref
var selected = true

func _ready():
	assert(tag != "")
	cursor_ref = get_parent().get_parent().get_node("Path2D/cursor")
	assert(cursor_ref)
	
func _process(delta):
	if global_position.distance_to(cursor_ref.global_position) < 100:
		selected = true
		scale = Vector2(3, 3)
	else:
		selected = false
		scale = Vector2(1, 1)
