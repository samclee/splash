extends Node2D

export var purpose = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	deactivate()
	
func deactivate():
	$big.visible = false
	$small.visible = true

func activate():
	$big.visible = true
	$small.visible = false
