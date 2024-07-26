extends Camera2D

@export var current_level : Level
var scroll_speed : int
#@export var player : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	scroll_speed = current_level.scroll_speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += scroll_speed * delta
