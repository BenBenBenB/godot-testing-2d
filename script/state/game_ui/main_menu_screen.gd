extends State
class_name MainMenuScreen
# can start level, go to settings, go to credits, quit game

@onready var main_menu: MainMenu = $"../../UIMain/MainMenu"
@onready var pause_menu: PauseMenu = $"../../UIMain/PauseMenu"
# import settings, credits once created

@onready var level_active_screen = $"../LevelActiveScreen"
@onready var settings_screen = $"../SettingsScreen"
@onready var credits_screen = $"../CreditsScreen"

func _ready():
	main_menu.StartLevel.connect(start_game)
	main_menu.Settings.connect(show_settings)
	main_menu.Credits.connect(show_credits)
	main_menu.Quit.connect(exit_game)

func enter():
	LevelManager.unload_level()
	main_menu.activate()

func exit_game():
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()

func show_settings():
	Transitioned.emit(settings_screen)
	
func show_credits():
	pass # todo
	#Transitioned.emit(credits_screen)

func start_game(level_id: int):
	main_menu.deactivate()
	LevelManager.load_level(level_id)
	Transitioned.emit(level_active_screen)
