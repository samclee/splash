extends Area2D

var active = false

# Called when the node enters the scene tree for the first time.
func _ready():
	deactivate()
	add_to_group("Item")


# activation
func activate():
	active = true
	$Sprite.visible = true
	
func deactivate():
	active = false
	$Sprite.visible = false
