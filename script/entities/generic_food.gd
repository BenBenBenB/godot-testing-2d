extends Area2D

@onready var sprite_2d = $Sprite2D
var mass: float = 2
@onready var food_type: int = randi_range(0, sprite_2d.hframes * sprite_2d.vframes - 1)

func _ready():
	set_food_type(food_type)

func _on_body_entered(body: CharacterBody2D):
	body.consume_mass(mass)
	queue_free()

func set_food_type(num: int):
	sprite_2d.frame = num
	match num:
		0:
			#beaker
			mass = 3
		1:
			#test tube
			mass = 2
		2:
			#flask
			mass = 4
		3:
			#magnifying glass
			mass = 3
		4:
			#fire extinguisher
			mass = 8
		5:
			#some meter thing
			mass = 4
		6:
			#petri dish
			mass = 2
		7:
			#test tube rack
			mass = 8
		8:
			#syringe
			mass = 4
		_:
			#error
			mass = 0
			print("Something went wrong here")
