extends State
class_name VictoryScreen
# can go back to main menu

@onready var state_machine_ui = $".."
@onready var main_menu_screen = $"../MainMenuScreen"


func enter():
	if not LevelManager.loaded_level.EndGame.is_connected(back_to_menu):
		LevelManager.loaded_level.EndGame.connect(back_to_menu)

func update(_delta):
	if Input.is_action_pressed("pause"):
		back_to_menu()

func back_to_menu():
	Transitioned.emit(main_menu_screen)
