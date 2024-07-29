extends Control
class_name MainMenu

signal StartLevel(level_id: int)
signal Settings()
signal Quit()
signal Credits()

@onready var title_music = $TitleMusic

func _on_play_button_pressed():
	StartLevel.emit(1)

func _on_settings_button_pressed():
	Settings.emit()

func _on_quit_button_pressed():
	Quit.emit()

func deactivate() -> void:
	hide()
	set_process(false)
	set_process_input(false)
	set_process_unhandled_input(false)
	title_music.stop();

func activate() -> void:
	show()
	set_process(true)
	set_process_input(true)
	set_process_unhandled_input(true)
	title_music.play();
