extends Sprite

export var portrait_width = 320

var base_pos
var left_pos
var right_pos

const name_frame_map = {
	"red_happy": 0,
	"blue_happy": 1
}

func _ready():
	base_pos = position
	left_pos = Vector2(texture.get_width() / -2, position.y)
	right_pos = Vector2(1000 + texture.get_width() / 2, position.y)
	hide()
	hframes = texture.get_width() / portrait_width

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
