extends Spawner

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(spawn_num):
		rect_spawn.call_deferred()

