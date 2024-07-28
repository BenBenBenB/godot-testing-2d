extends Control

@export var hover_particle : AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#this works but immediately closes menu because
	#my best guess is they're reading from the same frame of button release
	#because it still immediately closed the fucking menu
	#if get_node(".").is_in_group("pause menu"):
		#if Input.is_action_just_released("pause"):
			#_on_continue_button_pressed()
	pass


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

func _on_continue_button_pressed():
	#unpause, hides pause menu
	hide()
	get_tree().paused = false


func _on_menu_button_pressed():
	#load menu scene
	pass # Replace with function body.


func _on_retry_button_pressed():
	#reload current scene
	get_tree().paused = false
	get_tree().reload_current_scene()
