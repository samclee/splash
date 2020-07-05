extends Node2D

var items
var spawn_time = 0

func _ready():
	items = $items.get_children()
	start_spawn_timer()

func activate_random_item():
	var i = randi() % 3
	items[i].activate()

func start_spawn_timer():
	spawn_time = randi() % 3
	$Timer.start(spawn_time)

# signals
func _on_Timer_timeout():
	activate_random_item()

func _on_item_collected():
	start_spawn_timer()
