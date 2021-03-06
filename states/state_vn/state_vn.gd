extends Node2D

export(String, FILE, "*.json") var conv_path
export(String, FILE, "*.tscn") var next_scn_path
export(String, FILE, "*.tscn") var alt_next_scn_path = ""
export var last_scene = false

var taking_input = false

var conv = []
var cur_ind = 0

var alt_ending = false
var premature_ending = false

# main funcs
func _ready():
	conv = dlm.load_conv(conv_path)
	cur_ind = 0
	
func _on_overlay_fade_in_done():
	load_chunk()
	taking_input = true

func _input(event):
	if taking_input and event.is_action_pressed("primary"):
		proceed()
		
# proceeding and branching
func proceed():
	if $options.active:
		var target_label = $options.get_selected_label()
		$options.deactivate()
		jump(target_label)
	sfm.play_sfx("text_beep")
	load_chunk()

# dialog utility funcs
func load_chunk():
	taking_input = false
	# cycle thru all cmds before a text cmd
	while cur_ind < conv.size() and conv[cur_ind].func_name != "text":
		var line = conv[cur_ind]
		if has_method(line.func_name):
			callv(line.func_name, line.args)
		cur_ind += 1

	if cur_ind == conv.size() or premature_ending:
		slide_dialog_down()
		var path = alt_next_scn_path if alt_ending else next_scn_path
		if last_scene:
			$overlay.fade_to_credits(path)
		else:
			$overlay.fade_to_next_scene(path)
	else:
		callv("text", conv[cur_ind].args)
		cur_ind += 1
		taking_input = true

func text(text):
	$DialogLayer/RichTextLabel.bbcode_text = text

# cmds
# options
func option(text, jump_label):
	$options.add_option(text, jump_label)

func activate_options(options):
	$options.activate(options)

# portrait displaying
func active(side):
	var active_spkr = $speaker_l
	var inactive_spkr = $speaker_r
	
	if side == 'right':
		active_spkr = $speaker_r
		inactive_spkr = $speaker_l
		
	active_spkr.show()
	active_spkr.light()
	active_spkr.grow()
	
	inactive_spkr.dim()
	inactive_spkr.shrink()

func myshow(portrait_name, side):
	if side == 'left':
		$speaker_l.set_portrait(portrait_name)
	elif side == 'right':
		$speaker_r.set_portrait(portrait_name)
		
func myhide(side):
	if side == 'left':
		$speaker_l.hide()
	elif side == 'right':
		$speaker_r.hide()
		
func bump(side):
	if side == 'left':
		$speaker_l.bump()
	elif side == 'right':
		$speaker_r.bump()
		
		
func show_none():
	$speaker_l.hide()
	$speaker_r.hide()

func show_all():
	$speaker_l.show()
	$speaker_r.show()

# nameplate
func nameplate(name, side):
	$DialogLayer/nameplate.show()
	$DialogLayer/nameplate.set_name(name)
	if side == "left":
		$DialogLayer/nameplate.position = $left_nameplate_pos.position
	elif side == "right":
		$DialogLayer/nameplate.position = $right_nameplate_pos.position

func hide_nameplate():
	$DialogLayer/nameplate.hide()
	
# background
func bg(bg_name):
	$bgLayer/bg.texture = ResourceLoader.load("res://vn_bgs/" + bg_name + ".jpg")

# dialog box
func slide_dialog_down():
	$DialogLayer.slide_down()

func slide_dialog_up():
	$DialogLayer.slide_up()
	
# juice
func shake():
	$Camera2D.shake()
	
func music(song_name):
	aum.play_song(song_name)
	
func sfx(sfx_name):
	sfm.play_sfx(sfx_name)
	
# flow control
func jump(label_name):
	var label_ind = get_ind_of_label(label_name)
	cur_ind = label_ind

func get_ind_of_label(label_name):
	var ind = -1
	for i in range(0, conv.size()):
		if conv[i].func_name == 'label' and label_name == conv[i].args[0]:
			ind = i
			break
	assert(ind != -1)
	return ind
	
func set_next(path):
	next_scn_path = path
	
func ending(num):
	dlm.save(int(num))
	
func musicstop():
	aum.stream_paused = true
	
func musicplay():
	aum.stream_paused = false
	
func alt():
	alt_ending = true

func premature():
	premature_ending = true
