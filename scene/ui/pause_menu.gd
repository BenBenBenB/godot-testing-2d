extends Control
class_name PauseMenu

signal Continue()
signal LevelExit()
signal LevelRestart()

#@export var hover_particle: AnimatedSprite2D
@onready var pause_muzak = $PauseMuzak

func deactivate() -> void:
	hide()
	set_process(false)
	set_process_input(false)
	set_process_unhandled_input(false)
	if pause_muzak:
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
		pause_muzak.play();

#func _on_button_focus_entered(button_name):
	#if hover_particle != null:
		##get a reference to the button that sent the signal
		#var button = get_node(str("%", button_name))
		#if button:
			#hover_particle.position = Vector2(button.position.x, button.position.y + (button.size.y / 2))
			##hover_particle.position = button.position
			#hover_particle.visible = true
			#hover_particle.play("default")
		#
#func _on_button_focus_exited():
	#if hover_particle != null:
		#hover_particle.visible = false
		#hover_particle.stop()

func _on_continue_button_pressed():
	deactivate()
	Continue.emit()

func _on_menu_button_pressed():
	deactivate()
	LevelExit.emit()

func _on_retry_button_pressed():
	deactivate()
	LevelRestart.emit()
