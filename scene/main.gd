extends Node


@export var available_levels : Array[LevelData]

@onready var _scene_2d = $Scene2D

func _ready() -> void:
	LevelManager.main_scene = _scene_2d
	LevelManager.levels = available_levels
