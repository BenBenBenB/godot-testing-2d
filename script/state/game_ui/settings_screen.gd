extends State
class_name SettingsScreen
# can go back to main menu (or sub menus!)

@onready var settings: SettingsMenu = $"../../UIMain/Settings"

@onready var main_menu_screen = $"../MainMenuScreen"

func enter():
	settings.activate()
	
func exit():
	settings.deactivate()

func update(_delta):
	if Input.is_action_pressed("pause"):
		Transitioned.emit(main_menu_screen)
	
