extends Node

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
	
func create_save():
	print("Creating save")
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_line(to_json({"story1done": true}))
	save_game.close()

func load_save():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		print("No save found")
		return null
	save_game.open("user://savegame.save", File.READ)
	var save_data = parse_json(save_game.get_line())
	save_game.close()
	
	return save_data
	
func delete_save():
	print("Deleting save")
	var dir = Directory.new()
	dir.remove("user://savegame.save")
