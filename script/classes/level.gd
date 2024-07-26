class_name Level
extends Node

@export var level_id: int
@onready var audio_stream_player = $AudioStreamPlayer
@export var scroll_speed: int = 50

var level_data: LevelData

func _ready() -> void:
	level_data = LevelManager.get_level_data(level_id)
	if audio_stream_player:
		audio_stream_player.play()
