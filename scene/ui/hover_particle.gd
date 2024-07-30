extends AnimatedSprite2D
var button_list : Array

# Called when the node enters the scene tree for the first time.
func _ready():
	button_list = get_node("..").find_children("*utton","Button")
	for i in range(button_list.size()):
		print(button_list[i])
		button_list[i].focus_entered.connect(_on_button_focus_entered.bind(i))
		button_list[i].mouse_entered.connect(_on_button_focus_entered.bind(i))
		button_list[i].focus_exited.connect(_on_button_focus_exited)
		button_list[i].mouse_exited.connect(_on_button_focus_exited)
	
	_on_button_focus_exited()
	


func _on_button_focus_entered(index):
	var button = button_list[index]
	if button:
		position = Vector2(button.position.x, button.position.y + (button.size.y / 2))
		#hover_particle.position = button.position
		visible = true
		play("default")
		
func _on_button_focus_exited():
		visible = false
		stop()
