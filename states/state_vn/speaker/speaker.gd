extends Sprite

var left_pos
var right_pos
var left_off_pos
var right_off_pos

var w = 0
var h = 0

var portraits = {}

const side_dist = 225
const slide_time = 0.2

func _ready():
	load_portraits()
	
	w = texture.get_width()
	h = texture.get_height()

	offset.y = -h / 2
	
	left_off_pos = Vector2(w / -2, 600)
	left_pos = Vector2(side_dist, 600)
	right_pos = Vector2(1000 - side_dist, 600)
	right_off_pos = Vector2(1000 + w / 2, 600)

func dim():
	modulate = Color(0.7, 0.7, 0.7)

func light():
	modulate = Color(1.0, 1.0, 1.0)

func shrink():
	scale = Vector2(0.85, 0.85)

func grow():
	scale = Vector2(1, 1)

func set_portrait(name):
	texture = portraits[name]
	h = texture.get_height()
	offset.y = -h / 2
	
func load_portraits():
	var dir = Directory.new()
	var path = "res://assets/vn_portraits/";
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()

		while file_name != "":
			if file_name.ends_with("png"):
				portraits[file_name.left(file_name.length() - 4)] = load(path + file_name)
			file_name = dir.get_next()
		dir.list_dir_end()
