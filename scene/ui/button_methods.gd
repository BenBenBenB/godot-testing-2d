extends Control

@export var hover_particle : AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_focus_entered(name):
	if hover_particle != null:
		#get a reference to the button that sent the signal
		#print(get_node(str("%",button)))
		var button = get_node(str("%",name))
		hover_particle.position = Vector2(button.position.x, button.position.y + (button.size.y / 2))
		#hover_particle.position = button.position
		hover_particle.visible = true
		hover_particle.play("default")
		
func _on_button_focus_exited():
	if hover_particle != null:
		hover_particle.visible = false
		hover_particle.stop()
