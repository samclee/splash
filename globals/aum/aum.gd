extends AudioStreamPlayer

var songs = {}
var prefix = "res://assets/music/"

# Called when the node enters the scene tree for the first time.
func _ready():
	load_music()


func load_music():
	var dir = Directory.new()
	if dir.open(prefix) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()

		while file_name != "":
			file_name = file_name.replace('.import', '') # <--- remove the .import
			if file_name.ends_with("ogg"):
				songs[file_name.left(file_name.length() - 4)] = load(prefix + file_name)
			file_name = dir.get_next()
		dir.list_dir_end()

func play_song(song_name):
	assert(songs.has(song_name))
	stop()
	stream = songs[song_name]
	play()
	
func fade_in_song(song_name):
	volume_db = -35
	play_song(song_name)
	$Tween.interpolate_property(self, "volume_db", -35, -7, 0.9, Tween.TRANS_LINEAR)
	$Tween.start()

func fade_out_song():
	$Tween.interpolate_property(self, "volume_db", -7, -35, 0.9, Tween.TRANS_LINEAR)
	$Tween.start()

func _on_Tween_tween_completed(object, key):
	stop()
	volume_db = -7
