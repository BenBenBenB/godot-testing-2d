extends State
class_name VictoryScreen
# can go back to main menu

@onready var main_menu_screen = $"../MainMenuScreen"


func enter():
	LevelManager.unload_level()
	LevelManager.load_level(-1)
	LevelManager.loaded_level.EndGame.connect(back_to_menu)

func update(_delta):
	if Input.is_action_pressed("pause"):
		back_to_menu()

func back_to_menu():
	Transitioned.emit(main_menu_screen)
