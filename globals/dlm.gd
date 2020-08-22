extends Node

var songs = []

func _ready():
	randomize()

func load_conv(path: String):
	var f = File.new()
	assert(f.file_exists(path))
	f.open(path, File.READ)
	var dialog = parse_json(f.get_as_text())
	assert(dialog != null)
	assert(typeof(dialog) == TYPE_ARRAY)
	f.close()
	
	return dialog

# Saving
func create_save():
	print("Creating save")
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_line(to_json([false, false, false, false]))
	save_game.close()

func load_save():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		print("No save found")
		create_save()
	save_game.open("user://savegame.save", File.READ)
	var save_data = parse_json(save_game.get_line())
	save_game.close()
	
	return save_data
	
func save(ending_number):
	var data = load_save()
	data[ending_number] = true
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_line(to_json(data))
	save_game.close()
	
func delete_save():
	print("Deleting save")
	var dir = Directory.new()
	dir.remove("user://savegame.save")
