extends CharacterBody2D

var speed: int = 100
var size = 1.0
@onready var size_text : Label = $"CanvasLayer/Size Label"

func _ready():
	updateUI()

func get_input():
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_dir * speed

func consume_mass(food_value: float):
	size += food_value
	$CollisionShape2D.scale = Vector2(size, size)
	updateUI()

func _process(_delta):
	pass

func _physics_process(_delta):
	get_input()
	move_and_slide()
	
	#These are the 3 attributes I can access in code
	#Seems impossible to access a lot of the specific attributes in the particle emitter
	#If this is too jank to fix, we'll just scale the entire player up and call it a day
	if Input.is_key_pressed(KEY_C):
		#print($CollisionShape2D.scale)
		#print($GPUParticles2D.lifetime)
		#print($GPUParticles2D.amount)
		$CollisionShape2D.scale.x += 1
		$CollisionShape2D.scale.y += 1
		$GPUParticles2D.lifetime += 1
		$GPUParticles2D.amount += 10
	
	if Input.is_key_pressed(KEY_X):
		$CollisionShape2D.scale.x -= 1
		$CollisionShape2D.scale.y -= 1
		$GPUParticles2D.lifetime -= 1
		$GPUParticles2D.amount -= 10

func updateUI():
	size_text.text = str("Size: ", size)
