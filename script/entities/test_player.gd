extends CharacterBody2D

#level
@export var current_level: Level
var scroll_speed: int

#self
var speed: int = 125
var size: float = 10
var auto_forward: bool
var wall_bump_distance = 2
var left_wall = -120
const max_size: float = 100
const max_scale: float = 3.0
const min_scale: float = 0.5
var dead : bool = false

#UI
#@onready var size_text: Label = $"CanvasLayer/Size Label"


func _ready():
	#get info from level and update the UI
	scroll_speed = current_level.scroll_speed
	auto_forward = true
	#updateUI()
	#initialise player scale
	var ratio: float = (size / max_size) * (max_scale - min_scale) + min_scale
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
		var ratio: float = (size / max_size) * (max_scale - min_scale) + min_scale
		scale = Vector2(ratio, ratio)
		#This is to prevent the player from growing too big physically and get stuck in the level
	
	#updateUI()
	
	if food_value < 0:
		player_hurt()
	
	if size <= 0:
		#should use call_deffered but still error because it's called on self and it doesnt like that
		player_die()

func _process(delta):
	# this makes the player move with the camera
	# you will get stuck on obstacles if you try to move only backwards though somehow
	var delta_x = scroll_speed * delta
	left_wall += delta_x
	if auto_forward:
		position.x += delta_x
	if position.x < left_wall and not is_on_wall():
		position = Vector2(delta_x + left_wall, position.y)
	if position.x < left_wall:
		LevelManager.unload_level() # replace with a proper player_died method
	
	#detect game pausing input
	if Input.is_action_just_released("pause"):
		get_tree().paused = true
		get_node("%pause_menu").show()

@warning_ignore("unused_parameter")
func _physics_process(delta):
	if !dead:
		get_input()
	if is_on_wall():
		var normal = get_wall_normal()
		if normal.x < 1:
			position += normal * wall_bump_distance
			auto_forward = false
	if !dead:
		move_and_slide()

#func updateUI():
	#size_text.text = str("Size: ", size)

func player_hurt():
	#Need to show player that it hurted
	#Mainly just play visual and audio effects
	pass

signal stop_scroll

func player_die():
	#make player explode (play particle effect)
	#disable player
	dead = true
	scroll_speed = 0
	#tell camera to stop scrolling
	emit_signal("stop_scroll")
	#show death screen
	get_node("%death_menu").show()
	
	
