class_name MainMenu
extends Control

@onready var title_music = $TitleMusic

func _ready():
	pass

func _process(_delta):
	pass

func _on_play_button_pressed():
	LevelManager.load_level(1)
	deactivate()

#func _on_play_button_2_pressed():
	#LevelManager.load_level(2)
	#deactivate()

func _on_settings_button_pressed():
	pass

func _on_quit_button_pressed():
	get_tree().quit()

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

