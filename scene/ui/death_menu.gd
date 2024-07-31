extends Control
class_name DeathMenu

@onready var title_music = $backgroundMusic

signal RestartLevel()
signal ExitLevel()


func _on_menu_button_pressed():
	deactivate()
	ExitLevel.emit()

func _on_retry_button_pressed():
	deactivate()
	RestartLevel.emit()

func deactivate() -> void:
	hide()
	set_process(false)
	set_process_input(false)
	set_process_unhandled_input(false)
	title_music.stop()

func activate() -> void:
	show()
	set_process(true)
	set_process_input(true)
	set_process_unhandled_input(true)
	if not title_music.playing:
		title_music.play();
