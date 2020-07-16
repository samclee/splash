extends Node2D

const scn_selection_button = preload("res://states/state_vn/selection_button/selection_button.tscn")

var active = false
var cur_ind = 0
var option_names = []

# main funcs
func _ready():
	deactivate()
	
func _input(event):
	if visible:
		if event.is_action_pressed("ui_up"):
			cur_ind = max(cur_ind-1, 0)
			set_active_button(cur_ind)
		elif event.is_action_pressed("ui_down"):
			cur_ind = min(option_names.size()-1, cur_ind+1)
			set_active_button(cur_ind)
	
# interaction
func get_selected_label():
	return get_node(option_names[cur_ind]).tag

func set_active_button(ind):
	for i in range(0, option_names.size()):
		if i == ind:
			get_node(option_names[i]).activate()
		else:
			get_node(option_names[i]).deactivate()

# activation/decativation
func add_option(option):
	pass

func activate(options):
	visible = true
	active = true
	for option in options:
		var new_btn = scn_selection_button.instance()
		new_btn.set_text(option)
		new_btn.deactivate()
		add_child(new_btn)
		new_btn.position.y = 60 * option_names.size()
		option_names.push_back(new_btn.name)
		
	set_active_button(0)
		
func deactivate():
	visible = false
	active = false
	for child in get_children():
		child.call_deferred("queue_free")
