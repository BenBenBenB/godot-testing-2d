extends CharacterBody2D

var gravity = 0

@onready var animated_sprite_2d = $AnimatedSprite2D

func _process(_delta):
	animated_sprite_2d.play()

func _physics_process(_delta):
	move_and_slide()

