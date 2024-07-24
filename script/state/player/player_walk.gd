extends State
class_name PlayerWalk

@export var move_speed: float = 400.0
@export var idle_state: State

@onready var player_top_down = $"../.."
@onready var animated_sprite_2d = $"../../AnimatedSprite2D"

var walk_time: float

func enter():
	walk_time = 0.0

func exit():
	pass

func update(delta: float):
	walk_time += delta
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if input_dir.is_zero_approx():
		Transitioned.emit(self, idle_state)
	animated_sprite_2d.animation = "walk"

func physics_update(_delta: float):
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	player_top_down.velocity = input_dir * move_speed
