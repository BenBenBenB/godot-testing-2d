extends State
class_name SettingsScreen
# can go back to main menu (or sub menus!)

@onready var settings: SettingsMenu = $"../../UIMain/Settings"
@onready var pause_menu_screen = $"../PauseMenuScreen"
@onready var main_menu_screen = $"../MainMenuScreen"

var prev_state_log

func _ready():
	settings.close_settings.connect(close_screen)

func enter(prev_state = null):
	prev_state_log = prev_state
	#if prev_state == "PauseMenuScreen":
		##pause the game
		#LevelManager.pause_level()
		#get_tree().paused = true
	#print(prev_state)
	settings.show()
	
func exit():
	settings.hide()

func update(_delta):
	if Input.is_action_pressed("pause"):
		close_screen()

func close_screen():
	#print(prev_state_log)
	match prev_state_log:
		"PauseMenuScreen":
			Transitioned.emit(pause_menu_screen)
		"MainMenuScreen":
			Transitioned.emit(main_menu_screen)
		_:
			"Unknown prev state"
	
