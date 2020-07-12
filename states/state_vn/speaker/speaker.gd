extends Sprite

export var portrait_width = 320

var left_pos
var right_pos
var left_off_pos
var right_off_pos

var w = 0

const name_frame_map = {
	"red_happy": 0,
	"blue_happy": 1
}

const side_dist = 225
const slide_time = 0.2

func _ready():
	w = texture.get_width()
	left_off_pos = Vector2(w / -2, position.y)
	left_pos = Vector2(side_dist, position.y)
	right_pos = Vector2(1000 - side_dist, position.y)
	right_off_pos = Vector2(1000 + w / 2, position.y)
	hframes = w / portrait_width

func hide():
	visible = false
	
func show():
	visible = true

func dim():
	modulate = Color(0.7, 0.7, 0.7)

func light():
	modulate = Color(1.0, 1.0, 1.0)

func shrink():
	scale = Vector2(0.85, 0.85)

func grow():
	scale = Vector2(1, 1)

func set_portrait(name):
	frame = name_frame_map[name]
