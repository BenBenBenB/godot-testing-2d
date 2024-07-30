extends Control
class_name PauseMenu

signal Continue()
signal LevelExit()
signal LevelRestart()
signal Settings()

#@export var hover_particle: AnimatedSprite2D
@onready var pause_muzak = $PauseMuzak

var _resume_music_at: float = 0.0

func deactivate() -> void:
	hide()
	set_process(false)
	set_process_input(false)
	set_process_unhandled_input(false)
	if pause_muzak:
		_resume_music_at = pause_muzak.get_playback_position()
		pause_muzak.stop();
	get_tree().paused = false
	LevelManager.unpause_level()

func activate() -> void:
	LevelManager.pause_level()
	get_tree().paused = true
	show()
	set_process(true)
	set_process_input(true)
	set_process_unhandled_input(true)
	if pause_muzak:
		pause_muzak.play(_resume_music_at);

func _on_continue_button_pressed():
	deactivate()
	Continue.emit()

func _on_menu_button_pressed():
	deactivate()
	LevelExit.emit()

func _on_retry_button_pressed():
	deactivate()
	LevelRestart.emit()

func _on_pause_muzak_finished():
	pause_muzak.play()

func _on_settings_button_pressed():
	deactivate()
	Settings.emit()
