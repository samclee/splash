extends Sprite

var active = false
var next_scn_path = null

func _ready():
	modulate.a = 0.5
	deactivate()

func activate(path, verb):
	active = true
	visible = true
	next_scn_path = path
	$Label.text = verb
	
func deactivate():
	active = false
	visible = false

func _input(event):
	if active and event.is_action_pressed("primary"):
		if next_scn_path:
			get_tree().change_scene(next_scn_path)
		else:
			get_tree().reload_current_scene()
