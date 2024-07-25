extends CharacterBody2D

#level
@export var current_level : Level
var scroll_speed : int

#self
var speed: int = 125
var size : float = 10
const max_size : float = 100
const max_scale : float = 3.0
const min_scale : float = 0.5

#UI
@onready var size_text : Label = $"CanvasLayer/Size Label"

func _ready():
	#get info from level and update the UI
	scroll_speed = current_level.scroll_speed
	#initialise player scale
	var ratio : float = (size / max_size) * (max_scale - min_scale) + min_scale
	scale = Vector2(ratio, ratio)
	updateUI()

func get_input():
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_dir * speed

func consume_mass(food_value: float):
	size += food_value
	if size < max_size:
		var ratio : float = (size / max_size) * (max_scale - min_scale) + min_scale
		scale = Vector2(ratio, ratio) 
		#This is to prevent the player from growing too big physically and get stuck in the level
		
	updateUI()

func _process(_delta):
	# this makes the player move with the camera
	# you will get stuck on obstacles if you try to move only backwards though somehow
	position.x += scroll_speed * _delta

func _physics_process(_delta):
	get_input()
	move_and_slide()
	

func updateUI():
	size_text.text = str("Size: ", size)
