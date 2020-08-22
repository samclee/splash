extends "res://states/state_vn/state_vn.gd"

func _ready():
	pass

func proceed():
	if $paths_collection.active:
		var target_tag = $paths_collection.get_selected_tag()
		if target_tag:
			Sfm.play_sfx("selection")
			$paths_collection.deactivate()
			slide_dialog_up()
			jump(target_tag)
			load_chunk()
	else:
		Sfm.play_sfx("text_beep")
		load_chunk()

# cmds
# options
func options_path(path_name):
	slide_dialog_down()
	$paths_collection.activate(path_name)
