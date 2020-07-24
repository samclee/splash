extends Node2D

export var text = ""
export var tag = ""

var selected = false

func _ready():
	assert(text != "")
	assert(tag != "")
	$wrapper/offset_wrapper/Label.text = text
	
	# text spacing
	var off_r = $wrapper/offset_wrapper/Label.margin_right / 2
	var off_b = $wrapper/offset_wrapper/Label.margin_bottom / 2
	$wrapper/offset_wrapper.position = Vector2(-off_r, -off_b)

func activate():
	selected = true
	scale = Vector2(1.2, 1.2)
	$wrapper.rotation_degrees = 20
	
func deactivate():
	selected = false
	scale = Vector2(1, 1)
	$wrapper.rotation_degrees = 0

func _on_Area2D_area_entered(area):
	activate()


func _on_Area2D_area_exited(area):
	deactivate()
