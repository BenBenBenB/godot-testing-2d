extends State
class_name DeathScreen
# can go back to start of current level, or to main menu

@onready var main_menu_screen = $"../MainMenuScreen"
@onready var level_active_screen = $"../LevelActiveScreen"

@onready var death_menu: DeathMenu = $"../../UIMain/DeathMenu"


func _ready():
	death_menu.RestartLevel.connect(restart_level)
	death_menu.ExitLevel.connect(go_to_menu)

func enter():
	if LevelManager.loaded_level:
		LevelManager.loaded_level.stop_music()
	death_menu.activate()
	
func exit():
	death_menu.deactivate()

func go_to_menu():
	Transitioned.emit(main_menu_screen)
	
func restart_level():
	LevelManager.restart_level()
	Transitioned.emit(level_active_screen)
