extends Area2D

@onready var sprite_2d = $Sprite2D
var mass: float = -2
#separating the rat bullets and lab hazards
#This script will only spawn lab hazards
@onready var food_type : int = randi_range(4, 7)

func _ready():
	set_food_type(food_type)

func _on_body_entered(body: CharacterBody2D):
	body.consume_mass(mass)
	queue_free()

func set_food_type(num : int):
	sprite_2d.frame = num
	match num:
		4: 
			#light / energy orb
			mass = -10
		5:
			#Bunsen burner
			mass = -3
		6: 
			#fire
			mass = -8
		7:
			#light bulb
			mass = -5
		_:
			#error
			mass = 0
			print("Something went wrong here")
