extends Control
class_name SettingsMenu

signal close_settings()

var music_bus = AudioServer.get_bus_index("Music")
var sfx_bus = AudioServer.get_bus_index("SFX")

@onready var music_slider = $NinePatchRect/VBoxContainer/GridContainer/MusicSlider
@onready var sfx_slider = $NinePatchRect/VBoxContainer/GridContainer/SfxSlider
@onready var sfx_player = $sfx
	
func activate() -> void:
	show()
	set_process(true)
	set_process_input(true)
	set_process_unhandled_input(true)
	music_slider.value = db_to_linear(AudioServer.get_bus_volume_db(music_bus))
	sfx_slider.value = db_to_linear(AudioServer.get_bus_volume_db(sfx_bus))

func deactivate() -> void:
	hide()
	set_process(false)
	set_process_input(false)
	set_process_unhandled_input(false)

func _on_music_slider_mouse_exited():
	release_focus()
	
func _on_sfx_slider_mouse_exited():
	release_focus()

func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(music_bus, linear_to_db(value))

func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(sfx_bus, linear_to_db(value))

func _on_back_button_pressed():
	emit_signal("close_settings")

func _on_music_slider_drag_ended(value_changed):
	sfx_player.play_press_sfx()

func _on_sfx_slider_drag_ended(value_changed):
	sfx_player.play_press_sfx()
