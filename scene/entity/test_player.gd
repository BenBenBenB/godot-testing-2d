extends CharacterBody2D

#level
@export var current_level : Level
var scroll_speed : int

#self
var speed: int = 125
var size : float = 10
var auto_forward: bool
var wall_bump_distance = 2
const max_size : float = 100
const max_scale : float = 3.0
const min_scale : float = 0.5

#UI
@onready var size_text : Label = $"CanvasLayer/Size Label"
func _ready():
	#get info from level and update the UI
	scroll_speed = current_level.scroll_speed
	auto_forward = true
	updateUI()
	#initialise player scale
	var ratio : float = (size / max_size) * (max_scale - min_scale) + min_scale
	scale = Vector2(ratio, ratio)
	#set start position
	position = Vector2(32, 128)

func get_input():
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_dir * speed
	if not input_dir.is_zero_approx():
		auto_forward = true

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
	if auto_forward:
		position.x += scroll_speed * _delta

func _physics_process(delta):
	get_input()
	if is_on_wall():
		var normal = get_wall_normal()
		if normal.x < 1:
			position += normal * wall_bump_distance
			auto_forward = false
	move_and_slide()
	

func updateUI():
	size_text.text = str("Size: ", size)
