extends State
class_name VictoryScreen
# can go back to main menu

@onready var state_machine_ui = $".."


func enter():
	if not LevelManager.loaded_level.EndGame.is_connected(roll_credits):
		LevelManager.loaded_level.EndGame.connect(roll_credits)

func update(_delta):
	if Input.is_action_pressed("pause"):
		roll_credits()

func roll_credits():
	state_machine_ui.load_level(-2)
