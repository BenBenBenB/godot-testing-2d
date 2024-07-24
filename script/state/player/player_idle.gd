extends State
class_name PlayerIdle

@export var walk_state: State

@onready var player_top_down = $"../.."

var idle_timer: float

func enter():
	idle_timer = 0

func exit():
	pass

func update(delta: float):
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if not input_dir.is_zero_approx():
		Transitioned.emit(walk_state)
	player_top_down.animated_sprite_2d.animation = "idle"
	idle_timer += delta
		

func physics_update(_delta: float):
	pass
