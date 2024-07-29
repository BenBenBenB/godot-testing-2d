extends Area2D

@onready var anim_sprite : AnimatedSprite2D = $AnimatedSprite2D
var mass: float = 2
#hard coding the number of existing animations seems unavoidable atm
@onready var shroom_type : int = randi_range(0, 5)
var shroom_anim : String

func _ready():
	set_food_type(shroom_type)
	
func _process(_delta):
	anim_sprite.play(shroom_anim)

func _on_body_entered(body: CharacterBody2D):
	body.consume_mass(mass)
	queue_free()

func set_food_type(num : int):
	#sprite_2d.frame = num
	match num:
		0:
			#blue shroom
			mass = 12
			shroom_anim = "blue"
		1:
			#orange shroom
			mass = 15
			shroom_anim = "orange"
		2:
			#pale green shroom
			mass = 20
			shroom_anim = "pale green"
		3:
			#purple shroom
			mass = 18
			shroom_anim = "purple"
		4: 
			#red shroom
			mass = 20
			shroom_anim = "red"
		5:
			#yellow green shroom
			mass = 12
			shroom_anim = "yellow green"
		
		_:
			#error
			mass = 0
			print("Something went wrong here")
