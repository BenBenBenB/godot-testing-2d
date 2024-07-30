extends Spawner
@export var camera_ref : Camera2D
@export var current_level: Level

var scroll_speed : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#set position to be in front of camera beyond viewport
	if camera_ref != null:
		position = Vector2(camera_ref.position.x + (camera_ref.get_viewport_rect().size.x / 2), camera_ref.position.y) 
	#print(position)
	if current_level != null:
		scroll_speed = current_level.scroll_speed
	timer.timeout.connect(spawn_food)
	start_spawn_cooldown()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += scroll_speed * delta
	

func spawn_food():
	for i in range(spawn_num):
		rect_spawn()
	
	if !once_only:
		start_spawn_cooldown()
	
func stop():
	stop_spawning()
	scroll_speed = 0
	print("I have ceased")

