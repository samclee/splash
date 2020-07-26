extends Node2D

var cur_ind = 0
var second_button_ref
export(String, FILE, "*.tscn") var story_one_scene
export(String, FILE, "*.tscn") var story_two_scene


# Called when the node enters the scene tree for the first time.
func _ready():
	second_button_ref = $options/start_story2
	update_unlocks()
	set_active_button(0)
	
# input
func _input(event):
	if event.is_action_pressed("ui_up"):
		cur_ind = max(cur_ind-1, 0)
		set_active_button(cur_ind)
	if event.is_action_pressed("ui_down"):
		cur_ind = min(cur_ind+1, $options.get_child_count()-1)
		set_active_button(cur_ind)
	if event.is_action_pressed("primary"):
		match($options.get_children()[cur_ind].purpose):
			"start_story_one":
				start_story_one()
			"start_story_two":
				start_story_two()
			"delete":
				delete_save_data()
			"quit":
				quit()

# interaction
func set_active_button(ind):
	var options = $options.get_children()
	for i in range(0, options.size()):
		if i == ind:
			options[i].activate()
		else:
			options[i].deactivate()
			
# menu functions
func start_story_one():
	$overlay.fade_to_next_scene(story_one_scene)
	
func start_story_two():
	pass
	
func delete_save_data():
	dlm.delete_save()
	update_unlocks()

func quit():
	get_tree().quit()
	
# logic
func update_unlocks():
	var save_data = dlm.load_save()
	
	var story2unlocked = save_data[2] or save_data[3]
	if not story2unlocked:
		$options.remove_child(second_button_ref)
