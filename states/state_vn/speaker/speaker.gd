extends Sprite

var left_pos
var right_pos
var left_off_pos
var right_off_pos

var w = 0
var h = 0

var portraits = {
"Davonte_angry": preload("res://assets/vn_portraits/Davonte_angry.png"),
"Davonte_angryblush": preload("res://assets/vn_portraits/Davonte_angryblush.png"),
"Davonte_angryblushpaint": preload("res://assets/vn_portraits/Davonte_angryblushpaint.png"),
"Davonte_angrypaint": preload("res://assets/vn_portraits/Davonte_angrypaint.png"),
"Davonte_flirty": preload("res://assets/vn_portraits/Davonte_flirty.png"),
"Davonte_flirtyblush": preload("res://assets/vn_portraits/Davonte_flirtyblush.png"),
"Davonte_flirtyblushpaint": preload("res://assets/vn_portraits/Davonte_flirtyblushpaint.png"),
"Davonte_flirtypaint": preload("res://assets/vn_portraits/Davonte_flirtypaint.png"),
"Davonte_neutral": preload("res://assets/vn_portraits/Davonte_neutral.png"),
"Davonte_neutralblush": preload("res://assets/vn_portraits/Davonte_neutralblush.png"),
"Davonte_neutralblushpaint": preload("res://assets/vn_portraits/Davonte_neutralblushpaint.png"),
"Davonte_neutralpaint": preload("res://assets/vn_portraits/Davonte_neutralpaint.png"),
"Davonte_smile": preload("res://assets/vn_portraits/Davonte_smile.png"),
"Davonte_smileblush": preload("res://assets/vn_portraits/Davonte_smileblush.png"),
"Davonte_smileblushpaint": preload("res://assets/vn_portraits/Davonte_smileblushpaint.png"),
"Davonte_smilepaint": preload("res://assets/vn_portraits/Davonte_smilepaint.png"),
"Davonte_surprised": preload("res://assets/vn_portraits/Davonte_surprised.png"),
"Davonte_surprisedblush": preload("res://assets/vn_portraits/Davonte_surprisedblush.png"),
"Davonte_surprisedblushpaint": preload("res://assets/vn_portraits/Davonte_surprisedblushpaint.png"),
"Davonte_surprisedpaint": preload("res://assets/vn_portraits/Davonte_surprisedpaint.png"),
"Hao Yu_angry": preload("res://assets/vn_portraits/Hao Yu_angry.png"),
"Hao Yu_angryblush": preload("res://assets/vn_portraits/Hao Yu_angryblush.png"),
"Hao Yu_angryblushpaint": preload("res://assets/vn_portraits/Hao Yu_angryblushpaint.png"),
"Hao Yu_angrypaint": preload("res://assets/vn_portraits/Hao Yu_angrypaint.png"),
"Hao Yu_flirty": preload("res://assets/vn_portraits/Hao Yu_flirty.png"),
"Hao Yu_flirtyblush": preload("res://assets/vn_portraits/Hao Yu_flirtyblush.png"),
"Hao Yu_flirtyblushpaint": preload("res://assets/vn_portraits/Hao Yu_flirtyblushpaint.png"),
"Hao Yu_flirtypaint": preload("res://assets/vn_portraits/Hao Yu_flirtypaint.png"),
"Hao Yu_neutral": preload("res://assets/vn_portraits/Hao Yu_neutral.png"),
"Hao Yu_neutralblush": preload("res://assets/vn_portraits/Hao Yu_neutralblush.png"),
"Hao Yu_neutralblushpaint": preload("res://assets/vn_portraits/Hao Yu_neutralblushpaint.png"),
"Hao Yu_neutralpaint": preload("res://assets/vn_portraits/Hao Yu_neutralpaint.png"),
"Hao Yu_smile": preload("res://assets/vn_portraits/Hao Yu_smile.png"),
"Hao Yu_smileblush": preload("res://assets/vn_portraits/Hao Yu_smileblush.png"),
"Hao Yu_smileblushpaint": preload("res://assets/vn_portraits/Hao Yu_smileblushpaint.png"),
"Hao Yu_smilepaint": preload("res://assets/vn_portraits/Hao Yu_smilepaint.png"),
"Hao Yu_surprised": preload("res://assets/vn_portraits/Hao Yu_surprised.png"),
"Hao Yu_surprisedblush": preload("res://assets/vn_portraits/Hao Yu_surprisedblush.png"),
"Hao Yu_surprisedblushpaint": preload("res://assets/vn_portraits/Hao Yu_surprisedblushpaint.png"),
"Hao Yu_surprisedpaint": preload("res://assets/vn_portraits/Hao Yu_surprisedpaint.png")
}

const side_dist = 225
const slide_time = 0.2

func _ready():
	
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
	scale = Vector2(0.95, 0.95)

func grow():
	scale = Vector2(1, 1)

func set_portrait(name):
	texture = portraits[name]
	h = texture.get_height()
	w = texture.get_width()
	left_off_pos = Vector2(w / -2, 600)
	right_off_pos = Vector2(1000 + w / 2, 600)
	offset.y = -h / 2
