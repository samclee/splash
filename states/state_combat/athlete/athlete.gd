extends Area2D

const projectile_scn = preload("res://states/state_combat/projectiles/players/player_projectile.tscn")

signal athlete_hit
signal item_collected

export var throw_speed = 10
export var debug = false

var charged = false
var is_moving = false
var can_get_hit = true

var projectiles_ref

# standard
func _ready():
	add_to_group("Player")
	projectiles_ref = get_tree().get_root().get_node("state_combat/projectiles")
	$Sprite/AnimationPlayer.play("Stand")
	
	if debug:
		can_get_hit = false

func _input(event):
	if event.is_action_pressed("primary") and charged:
		throw()

func _process(delta):
	var cur_anim_name = $Sprite/AnimationPlayer.current_animation
	if $Sprite/AnimationPlayer.is_playing() == false:
		$Sprite/AnimationPlayer.play("Stand")
	if cur_anim_name == "Run" or cur_anim_name == "Stand":
		if is_moving:
			$Sprite/AnimationPlayer.play("Run")
		else:
			$Sprite/AnimationPlayer.play("Stand")

# input
func throw():
	$Sprite/AnimationPlayer.play("Throw")
	charged = false
	var new_projectile = projectile_scn.instance()
	projectiles_ref.add_child(new_projectile)
	new_projectile.position = global_position

# touched something
func _on_athlete_area_entered(area):
	if area.is_in_group("Item") and area.active:
		area.deactivate()
		get_charged()
		emit_signal("item_collected")
	elif area.is_in_group("EnemyProjectile") and can_get_hit:
		area.explode()
		get_hurt()
		emit_signal("athlete_hit")

# responses
func get_hurt():
	$Sprite/AnimationPlayer.play("Hurt")

func get_charged():
	charged = true
	# change visual effect
