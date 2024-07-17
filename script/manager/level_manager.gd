extends Node

var levels : Array[LevelData]

var main_scene : Node2D = null
var loaded_level : Level = null

func unload_level() -> void:
	if is_instance_valid(loaded_level):
		loaded_level.queue_free()
		
	loaded_level = null
	
func load_level(level_id:int) -> void:
	unload_level()
	var level_data : LevelData = get_level_data(level_id)
	if not level_data:
		return
		
	var level_path = "res://scene/%s.tscn" % [level_data.level_path]
	var level_res := load(level_path)
	
	if level_res:
		loaded_level = level_res.instantiate()
		main_scene.add_child(loaded_level)
	else:
		print("level not found: %s" % [level_path])


func get_level_data(id: int) -> LevelData:
	var level_data : LevelData = null
	for lvl : LevelData in levels:
		if lvl.level_id == id:
			return lvl
	return null
