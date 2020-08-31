extends Node

var sfx= {}

func _ready():
	load_sfx()

func load_sfx():
	var dir = Directory.new()
	var path = "res://assets/sfx/";
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()

		while file_name != "":
			file_name = file_name.replace('.import', '') # <--- remove the .import
			if file_name.ends_with("wav"):
				var new_player = AudioStreamPlayer.new()
				add_child(new_player)
				new_player.stream = load(path + file_name)
				new_player.volume_db = -15
				sfx[file_name.left(file_name.length() - 4)] = new_player.name
			file_name = dir.get_next()
		dir.list_dir_end()
		
func play_sfx(sfx_name):
	assert(has_node(sfx[sfx_name]))
	get_node(sfx[sfx_name]).play()
