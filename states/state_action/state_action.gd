extends "res://states/state_vn/state_vn.gd"

var path_refs = {}

func _ready():
	var paths = $paths.get_children()
	store_all_paths()

func proceed():
	var next_ind = cur_ind + 1
	var skip_tag = get_skip_to()
	
	var paths = $paths.get_children()
	if paths.size() == 1:
		var target_tag = paths[0].get_selected_tag()
		if target_tag:
			print(target_tag)
			next_ind = get_ind_of_tag(target_tag)
			store_path(paths[0])
			slide_dialog_up()
		else:
			print("miss")
			return
	elif skip_tag:
		next_ind = get_ind_of_tag(skip_tag)
		
	
	cur_ind = next_ind
	if cur_ind < conv.size():
		if end_conv:
			taking_input = false
			slide_dialog_down()
			$overlay.fade_to_next_scene(next_scn_path)
		else:
			load_line(conv[cur_ind])
	else:
		taking_input = false
		slide_dialog_down()
		$overlay.fade_to_next_scene(next_scn_path)

# node manipulation
func store_all_paths():
	var paths = $paths.get_children()
	for p in paths:
		store_path(p)

func store_path(p):
	path_refs[p.name] = p
	$paths.remove_child(p)

# cmds
# options
func activate_options_path(path_name):
	slide_dialog_down()
	$paths.add_child(path_refs[path_name])
