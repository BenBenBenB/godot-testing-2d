extends Control
class_name DeathMenu

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

func activate() -> void:
	show()
	set_process(true)
	set_process_input(true)
	set_process_unhandled_input(true)
