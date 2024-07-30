extends Spawner

@export var variance : int = 0

func vomit_spawn():
	var min_num = spawn_num - variance
	var max_num = spawn_num + variance
	if min_num < 0:
		min_num = 0
	for i in range(randi_range(min_num, max_num)):
		if spawn_rect > Vector2(0,0):
			rect_spawn()
		elif spawn_radius > 0:
			circle_spawn()
		else:
			point_spawn()
