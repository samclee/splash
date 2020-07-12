extends "res://states/state_vn/state_vn.gd"

func _ready():
	pass

func proceed():
	var next_ind = cur_ind + 1
	var skip_tag = get_skip_to()
	
	if $paths_collection.active:
		var target_tag = $paths_collection.get_selected_tag()
		if target_tag:
			next_ind = get_ind_of_tag(target_tag)
			slide_dialog_up()
		else:
			return
	elif skip_tag:
		next_ind = get_ind_of_tag(skip_tag)
		
	$paths_collection.deactivate()
		
	
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

# cmds
# options
func activate_options_path(path_name):
	slide_dialog_down()
	$paths_collection.activate(path_name)
