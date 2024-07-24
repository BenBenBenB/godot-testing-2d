extends CharacterBody2D

var gravity = 0

@export var mass: float = 1000.0
const NORMALMASS: float = 1000.0
@onready var animated_sprite_2d = $AnimatedSprite2D

func _process(_delta):
	animated_sprite_2d.flip_h = velocity.x < 0
	animated_sprite_2d.play()
	if Input.is_action_pressed("grow"):
		mass += 1
	elif Input.is_action_pressed("shrink"):
		mass -= 1
	var scale_factor = mass/NORMALMASS
	scale = Vector2(scale_factor,scale_factor)

func _physics_process(_delta):
	move_and_slide()

func consume_mass(item_value: int):
	mass += item_value
