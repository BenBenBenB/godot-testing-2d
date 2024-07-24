extends State
class_name PlayerIdle

@export var walk_state: State

@onready var animated_sprite_2d = $"../../AnimatedSprite2D"

var idle_timer: float

func enter():
	idle_timer = 0

func exit():
	pass

func update(delta: float):
	idle_timer += delta
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if not direction.is_zero_approx():
		Transitioned.emit(self, walk_state)
	animated_sprite_2d.animation = "idle"
		

func physics_update(_delta: float):
	pass
