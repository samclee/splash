extends Area2D

const projectile_scn = preload("res://states/state_combat/projectiles/enemies/enemy_projectile.tscn")

signal enemy_hit

export var spd_factor = 1
export var fire_rate = 8
export var pathes = [
	["C"]
]

var can_get_hit = true

var start_pos
var target_pos
var progress = 0

var waypoints = {}
var path_ind = 0
var cur_path = []
var waypoint_ind = 0

var projectiles_ref


# standard
func _ready():
	add_to_group("Enemy")
	projectiles_ref = get_tree().get_root().get_node("state_combat/projectiles")
	cur_path = pathes[path_ind]
	var waypoint_scns = get_tree().get_root().get_node("state_combat/waypoints").get_children()
	for wp in waypoint_scns:
		waypoints[wp.name] = wp.position
	position = waypoints[cur_path[waypoint_ind]]
	reset_movement()
	$Timer.start(fire_rate)

func _process(delta):
	progress += delta * spd_factor
	if progress >= 1:
		reset_movement()
		
	position = lerp(start_pos, target_pos, progress)

# throwing
func reset_throw_timer():
	$Timer.start(fire_rate)
	throw()
	
func throw():
	var new_projectile = projectile_scn.instance()
	projectiles_ref.add_child(new_projectile)
	new_projectile.position = global_position
	
# track following
func reset_movement():
	progress = 0
	waypoint_ind = (waypoint_ind + 1) % cur_path.size()
	start_pos = position
	target_pos = waypoints[cur_path[waypoint_ind]]

func new_path():
	path_ind = randi() % pathes.size()
	cur_path = pathes[path_ind]
	reset_movement()
	
# control
func overdrive():
	can_get_hit = false
	fire_rate = 0.2
	spd_factor = 2
	
func stop():
	can_get_hit = false
	$Timer.stop()
	spd_factor = 0

# callbacks
func _on_enemy_area_entered(area):
	if area.is_in_group("PlayerProjectile") and can_get_hit:
		area.explode()
		emit_signal("enemy_hit")
		new_path()
