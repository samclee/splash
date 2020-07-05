extends KinematicBody2D

var MAX_SPD = 300

var athletes
var vel = Vector2.ZERO

# standard functions
func _ready():
	athletes = $athletes.get_children()

func _physics_process(delta):
	var input_vec = Vector2.ZERO
	input_vec.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vec.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vec = input_vec.normalized()
	
	if input_vec != Vector2.ZERO:
		vel = input_vec
		tell_athletes_run()
	else:
		vel = Vector2.ZERO
		tell_athletes_stand()

	move_and_slide(vel * MAX_SPD)

# update athlete animations
func tell_athletes_stand():
	for a in athletes:
		a.is_moving = false
	
func tell_athletes_run():
	for a in athletes:
		a.is_moving = true
