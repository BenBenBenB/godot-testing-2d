extends State
class_name PlayerWalk

@export var move_speed: float = 400.0
@export var idle_state: State

@onready var player_top_down = $"../.."
@onready var animated_sprite_2d = $"../../AnimatedSprite2D"

var walk_timer: float = 0.0

func enter():
	walk_timer = 0.0

func exit():
	pass

func update(delta: float):
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if input_dir.is_zero_approx():
		Transitioned.emit(idle_state)
	animated_sprite_2d.animation = "walk"
	walk_timer += delta

func physics_update(_delta: float):
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	player_top_down.velocity = input_dir * move_speed
