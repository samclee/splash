extends Node2D

var items
var spawn_time = 0
var cur_ind = 2
var ind_ary = [0, 1, 2]

func _ready():
	items = $items.get_children()
	randomize_order()
	start_spawn_timer()

func activate_random_item():
	var i = randi() % 3
	get_next_item()
	

func start_spawn_timer():
	spawn_time = randi() % 3
	$Timer.start(spawn_time)

# signals
func _on_Timer_timeout():
	activate_random_item()

func _on_item_collected():
	start_spawn_timer()

# random order
func get_next_item():
	cur_ind = (cur_ind + 1) % 3
	if cur_ind == 0:
		randomize_order()
	items[ind_ary[cur_ind]].activate()

func randomize_order():
	for i in range(2):
		if randf() >= 0.5:
			var temp = ind_ary[i]
			ind_ary[i] = ind_ary[i+1]
			ind_ary[i+1] = temp
