extends State
class_name MainMenuScreen
# can start level, go to settings, go to credits, quit game

@onready var state_machine_ui = $".."
# UIs
@onready var main_menu: MainMenu = $"../../UIMain/MainMenu"
@onready var pause_menu: PauseMenu = $"../../UIMain/PauseMenu"
# states
@onready var level_active_screen = $"../LevelActiveScreen"
@onready var settings_screen = $"../SettingsScreen"

func _ready():
	main_menu.StartLevel.connect(start_game)
	main_menu.Settings.connect(show_settings)
	main_menu.Credits.connect(show_credits)
	main_menu.Quit.connect(exit_game)

func enter():
	state_machine_ui.load_level(0)
	main_menu.activate()

func exit_game():
	main_menu.deactivate()
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()

func show_settings():
	Transitioned.emit(settings_screen)
	
func show_credits():
	main_menu.deactivate()
	state_machine_ui.load_level(-2)

func start_game(level_id: int):
	main_menu.deactivate()
	state_machine_ui.load_level(level_id)
