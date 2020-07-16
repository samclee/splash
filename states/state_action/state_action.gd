extends "res://states/state_vn/state_vn.gd"

func _ready():
	pass

func proceed():	
	if $paths_collection.active:
		var target_tag = $paths_collection.get_selected_tag()
		if target_tag:
			$paths_collection.deactivate()
			slide_dialog_up()
			jump(target_tag)
		else:
			return
	load_chunk()
# cmds
# options
func activate_options_path(path_name):
	slide_dialog_down()
	$paths_collection.activate(path_name)
