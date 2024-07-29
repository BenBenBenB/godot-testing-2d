extends Control
class_name DeathMenu

signal RestartLevel()
signal ExitLevel()

@export var hover_particle : AnimatedSprite2D

func _on_button_focus_entered(button_name):
	if hover_particle != null:
		#get a reference to the button that sent the signal
		#print(get_node(str("%",button)))
		var button = get_node(str("%",button_name))
		hover_particle.position = Vector2(button.position.x, button.position.y + (button.size.y / 2))
		#hover_particle.position = button.position
		hover_particle.visible = true
		hover_particle.play("default")
		
func _on_button_focus_exited():
	if hover_particle != null:
		hover_particle.visible = false
		hover_particle.stop()

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
