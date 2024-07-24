extends Node

@export var available_levels : Array[LevelData]

@onready var _scene_2d = $Scene2D
@onready var _main_menu = $UIMain/MainMenu

func _ready() -> void:
	LevelManager.main_scene = _scene_2d
	LevelManager.levels = available_levels

func _process(delta):
	if Input.is_action_just_pressed("exit"):
		LevelManager.unload_level()
		_main_menu.activate()
