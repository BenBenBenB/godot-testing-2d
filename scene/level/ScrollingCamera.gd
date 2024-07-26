extends Camera2D

@export var current_level : Level
@export var tilemap : TileMap
var scroll_speed : int

@onready var found_mushroom : bool = false
var start_pos : Vector2
var marker_pos : Vector2
@onready var t : float = 0.0
#@export var player : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	scroll_speed = current_level.scroll_speed
	set_camera_limits()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += scroll_speed * delta
	
	# moves to a y pos that sees the mush-room
	# probably a dumb janky way to do this but this is what i can think of rn
	if found_mushroom:
		# takes 5s to interpolate to the target
		t += delta / 5
		position.y = lerpf(start_pos.y, marker_pos.y, t)
		#to stop this bit from continuously running after it's done
		#idk if it's necessary though
		if t > 1:
			found_mushroom = false

func set_camera_limits():
	#this reads how large the tile map is
	#then sets the camera limit based on the size of the tile map
	#limit makes it so the camera auto stops and will not go further than set limit
	var map_limits = tilemap.get_used_rect()
	var map_cellsize = tilemap.rendering_quadrant_size
	limit_left = map_limits.position.x * map_cellsize
	limit_right = map_limits.end.x * map_cellsize
	limit_top = map_limits.position.y * map_cellsize
	limit_bottom = map_limits.end.y * map_cellsize
	
func move_to_mushroom(marker : Vector2):
	start_pos = position
	marker_pos = marker
	found_mushroom = true
