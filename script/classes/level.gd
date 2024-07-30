class_name Level
extends Node

signal completed_level(next_level_id: int)
signal won_entire_game()

@export var level_id: int
@onready var audio_stream_player: AudioStreamPlayer = $BackgroundMusic
#default is 0, please set speed in inspector
@export var scroll_speed: int = 0

var _resume_music_at: float = 0.0

var level_data: LevelData

func _ready() -> void:
	level_data = LevelManager.get_level_data(level_id)
	if audio_stream_player:
		audio_stream_player.play()

func pause() -> void:
	_resume_music_at = audio_stream_player.get_playback_position()
	audio_stream_player.stop()
	
func unpause() -> void:
	audio_stream_player.play(_resume_music_at)
