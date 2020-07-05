extends Node2D

export(String, FILE, "*.json") var conv_path
export(String, FILE, "*.tscn") var next_scn_path

var conv = []
var cur_ind = 0
var cur_data = {}

# main funcs
func _ready():
	conv = dlm.load_conv(conv_path)
	cur_ind = 0
	load_line(conv[cur_ind])

func _input(event):
	if event.is_action_pressed("primary"):
		proceed()
		
# proceeding and branching
func proceed():
	var next_ind = cur_ind + 1
	var skip_tag = get_skip_to()
	if $options.visible:
		var target_tag = $options.get_selected_tag()
		next_ind = get_ind_of_tag(target_tag)
	elif skip_tag:
		next_ind = get_ind_of_tag(skip_tag)
		
	$options.deactivate()
	
	cur_ind = next_ind
	if cur_ind < conv.size():
		load_line(conv[cur_ind])
	else:
		$overlay.fade_to_next_scene(next_scn_path)
	
func get_ind_of_tag(tag):
	var ind = -1
	for i in range(0, conv.size()):
		if tag == get_tag(conv[i]):
			ind = i
			break
	assert(ind != -1)
	
	return ind
		
func get_tag(line):
	var tag = null
	if is_dict(line) and line.has("data") and line.data.has("tag"):
		tag = line.data.tag
	
	return tag
		
func get_skip_to():
	if cur_data and cur_data.has("skip_to"):
		return cur_data.skip_to
		
	return null

# dialog utility funcs
func load_line(line):
	if is_str(line):
		set_text(line)
	elif is_dict(line):
		parse_package(line)

func parse_package(pkg):
	assert(pkg.has("text"))
	set_text(pkg.text)
	if pkg.has("cmds"):
		execute_cmds(pkg.cmds)
	
	if pkg.has("data") and pkg.data.size() > 0:
		cur_data = pkg.data
	else:
		cur_data = null

func execute_cmds(cmds):
	for cmd_name in cmds:
		var arg = cmds[cmd_name]
		if typeof(arg) == TYPE_ARRAY and arg.size() == 0:
			call(cmd_name)
		else:
			call(cmd_name, cmds[cmd_name])
		

func set_text(text):
	$CanvasLayer/RichTextLabel.bbcode_text = text

# cmds
func activate_options(options):
	$options.activate(options)
	
func left(names):
	$speaker_l.show()
	$speaker_l.light()
	$speaker_l.grow()
	$speaker_r.dim()
	$speaker_r.shrink()
	set_l_speaker(names[1])
	set_nameplate(names[0], "left")
	
func right(names):
	$speaker_l.dim()
	$speaker_l.shrink()
	$speaker_r.show()
	$speaker_r.light()
	$speaker_r.grow()
	set_r_speaker(names[1])
	set_nameplate(names[0], "right")

func set_l_speaker(portrait_name):
	$speaker_l.set_portrait(portrait_name)
	
func set_r_speaker(portrait_name):
	$speaker_r.set_portrait(portrait_name)

func hide_l():
	$speaker_l.hide()
	
func hide_r():
	$speaker_r.hide()
	
func none():
	$speaker_l.hide()
	$speaker_r.hide()
	$CanvasLayer/nameplate.hide()
	
func set_nameplate(name, side):
	$CanvasLayer/nameplate.show()
	$CanvasLayer/nameplate.set_name(name)
	if side == "left":
		$CanvasLayer/nameplate.position = $left_nameplate_pos.position
	elif side == "right":
		$CanvasLayer/nameplate.position = $right_nameplate_pos.position
	
func shake():
	$Camera2D.shake()
	
func play_music(song_name):
	pass
	
func play_sfx(sfx_name):
	pass
	
# type checking
func is_str(val):
	return typeof(val) == TYPE_STRING
	
func is_dict(val):
	return typeof(val) == TYPE_DICTIONARY