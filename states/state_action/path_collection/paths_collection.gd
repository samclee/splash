extends Node2D

var active = false

var path_refs = {}

func _ready():
	position.y = -530
	store_all_paths()
	
# public api
func get_selected_tag():
	return $paths.get_child(0).get_selected_tag()
	
func start():
	return $paths.get_child(0).start()
	
func stop():
	return $paths.get_child(0).stop()

# node manipulation
func store_all_paths():
	var paths = $paths.get_children()
	for p in paths:
		store_path(p)

func store_path(p):
	path_refs[p.name] = p
	$paths.remove_child(p)
	
# activation
func activate(path_name):
	assert(path_refs.has(path_name))
	active = true
	$paths.add_child(path_refs[path_name])
	start()
	$Tween.interpolate_property(self, "position:y", -530, 70, 0.5, Tween.TRANS_EXPO, Tween.EASE_OUT)
	$Tween.start()
	
func deactivate():
	if not active:
		return
	active = false
	stop()
	$Tween.interpolate_property(self, "position:y", 70, -530, 0.5, Tween.TRANS_LINEAR)
	$Tween.interpolate_callback(self, 0.2, "store_all_paths")
	$Tween.start()
