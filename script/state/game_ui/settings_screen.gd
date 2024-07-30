extends State
class_name SettingsScreen
# can go back to main menu (or sub menus!)

@onready var settings: SettingsMenu = $"../../UIMain/Settings"

@onready var main_menu_screen = $"../MainMenuScreen"

func _ready():
	settings.close_settings.connect(close_screen)

func enter():
	settings.show()
	
func exit():
	settings.hide()

func update(_delta):
	if Input.is_action_pressed("pause"):
		close_screen()

func close_screen():
	Transitioned.emit(main_menu_screen)
