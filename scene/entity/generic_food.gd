extends Area2D

@onready var sprite_2d = $Sprite2D
@export var mass: float = 2
@onready var food_type : int = randi_range(0, sprite_2d.hframes * sprite_2d.vframes - 1)

func _ready():
	set_food_type(food_type)

func _on_body_entered(body: CharacterBody2D):
	body.consume_mass(mass)
	queue_free()

func set_food_type(num : int):
	sprite_2d.frame = num
	#print(sprite_2d.material)
	#unsure if I can access the shader color from here.
	#If I can, then we can just set the outline color based on what it is as well
	#Since I currently have bunsen burner hurt the player with negative mass
	#So ideally it'd have a different outline color
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
			#Bunsen burner
			#It should shrink the player
			mass = -3
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
			mass = 2
			print("Something went wrong here")
