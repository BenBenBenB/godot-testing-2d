extends Camera2D

var scroll_speed : int = 50
#@export var player : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	#need to figure out how to get the scroll speed from the level script
	#scroll_speed = node
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += scroll_speed * delta
