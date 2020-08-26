extends Node2D

var cur_ind = 0
var story2unlocked = false
export(String, FILE, "*.tscn") var story_one_scene
export(String, FILE, "*.tscn") var story_two_scene


# Called when the node enters the scene tree for the first time.
func _ready():
	Aum.play_song("title")
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
		match(cur_ind):
			0:
				start_story_one()
			1:
				start_story_two()
			2:
				delete_save_data()
			3:
				quit()

# interaction
func set_active_button(ind):
	Sfm.play_sfx("text_beep")
	$davonte_bio_card.hide()
	$hao_yu_bio.hide()
	$red_bg.hide()
	$blue_bg.hide()
	
	if ind % 2 == 0:
		$red_bg.show()
	else:
		$blue_bg.show()
	
	if ind == 0:
		$davonte_bio_card.show()
	if ind == 1:
		$hao_yu_bio.show()
			
	var options = $options.get_children()
	for i in range(0, options.size()):
		if i == ind:
			options[i].activate()
		else:
			options[i].deactivate()
			
# menu functions
func start_story_one():
	$overlay.fade_to_next_scene(story_one_scene)
	Aum.fade_out_song()
	
func start_story_two():
	if story2unlocked:
		$overlay.fade_to_next_scene(story_two_scene)
		Aum.fade_out_song()
	
func delete_save_data():
	dlm.delete_save()
	update_unlocks()

func quit():
	get_tree().quit()
	
# logic
func update_unlocks():
	var save_data = dlm.load_save()
	story2unlocked = save_data[0] or save_data[1]
	if not story2unlocked:
		$options/start_story2.modulate = Color(0.5, 0.5,0.5)
	else:
		$options/start_story2.modulate = Color(1, 1, 1)
