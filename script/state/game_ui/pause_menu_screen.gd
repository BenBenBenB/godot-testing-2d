extends State
class_name PauseMenuScreen
# can go back to level, to start of level, or to main menu

@onready var pause_menu: PauseMenu = $"../../UIMain/PauseMenu"
@onready var pause_timer = $"../../PauseTimer"

@onready var main_menu_screen = $"../MainMenuScreen"
@onready var level_active_screen = $"../LevelActiveScreen"
@onready var death_screen = $"../DeathScreen"
@onready var settings_screen = $"../SettingsScreen"

func _ready():
	pause_menu.Continue.connect(continue_level)
	pause_menu.LevelExit.connect(go_to_main_menu)
	pause_menu.LevelRestart.connect(restart_level)
	pause_menu.Settings.connect(show_settings)

func enter():
	if not get_tree().paused:
		pause_menu.activate()

func exit():
	pass
	
func update(_delta):
	if Input.is_action_just_pressed("pause"):
		Transitioned.emit(level_active_screen)
	var player = get_tree().get_first_node_in_group("Player")
	if is_instance_of(player, PlayerBlackhole) and player.is_dead():
		player_died()

func player_died():
	pause_menu.deactivate()
	Transitioned.emit(death_screen)

func continue_level():
	pause_timer.start()
	pause_menu.deactivate()
	Transitioned.emit(level_active_screen)

func restart_level():
	LevelManager.restart_level()
	pause_menu.deactivate()
	Transitioned.emit(level_active_screen)

func go_to_main_menu():
	pause_menu.deactivate()
	Transitioned.emit(main_menu_screen)

func show_settings():
	Transitioned.emit(settings_screen)
