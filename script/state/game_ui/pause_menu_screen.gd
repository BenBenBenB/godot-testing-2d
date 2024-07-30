extends State
class_name PauseMenuScreen
# can go back to level, to start of level, or to main menu

@onready var pause_menu: PauseMenu = $"../../UIMain/PauseMenu"
@onready var pause_timer = $"../../PauseTimer"

@onready var main_menu_screen = $"../MainMenuScreen"
@onready var level_active_screen = $"../LevelActiveScreen"
@onready var settings_screen = $"../SettingsScreen"

func _ready():
	pause_menu.Continue.connect(continue_level)
	pause_menu.LevelExit.connect(go_to_main_menu)
	pause_menu.LevelRestart.connect(restart_level)
	pause_menu.Settings.connect(show_settings)

func enter():
	get_tree().paused = true
	pause_menu.activate()

func exit():
	pause_menu.deactivate()
	get_tree().paused = false

func update(_delta):
	if Input.is_action_just_pressed("pause"):
		Transitioned.emit(level_active_screen)

func continue_level():
	pause_timer.start()
	Transitioned.emit(level_active_screen)

func restart_level():
	LevelManager.restart_level()
	Transitioned.emit(level_active_screen)

func go_to_main_menu():
	Transitioned.emit(main_menu_screen)
	pause_menu.deactivate()

func show_settings():
	Transitioned.emit(settings_screen)
