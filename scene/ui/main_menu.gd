class_name MainMenu
extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_pressed():
	LevelManager.load_level(1)
	deactivate()

func _on_settings_button_pressed():
	pass # Replace with function body.


func _on_quit_button_pressed():
	get_tree().quit()

func deactivate() -> void:
	hide()
	set_process(false)
	set_process_input(false)
	set_process_unhandled_input(false)

func activate() -> void:
	show()
	set_process(true)
	set_process_input(true)
	set_process_unhandled_input(true)
