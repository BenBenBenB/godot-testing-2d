extends Node

@export var available_levels: Array[LevelData]

@onready var _scene_2d = $Scene2D

var music_bus = AudioServer.get_bus_index("Music")
var sfx_bus = AudioServer.get_bus_index("SFX")

func _ready() -> void:
	LevelManager.main_scene = _scene_2d
	LevelManager.levels = available_levels
	AudioServer.set_bus_volume_db(music_bus, linear_to_db(0.2))
	AudioServer.set_bus_volume_db(sfx_bus, linear_to_db(0.5))
