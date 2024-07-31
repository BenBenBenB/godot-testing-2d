extends State

@onready var state_machine_ui = $".."
@onready var main_menu_screen = $"../MainMenuScreen"
@onready var level_active_screen = $"../LevelActiveScreen"
@onready var victory_screen = $"../VictoryScreen"

func enter():
	pass # display loading screen
	
func exit():
	pass # display loading screen
	
func update(_delta):
	if is_level_loaded():
		if state_machine_ui.current_level_id == 0:
			Transitioned.emit(main_menu_screen)
		elif state_machine_ui.current_level_id == -1:
			Transitioned.emit(victory_screen)
		else:
			Transitioned.emit(level_active_screen)
			
func is_level_loaded():
	var should_be_loaded_id = state_machine_ui.current_level_id
	var currently_loaded_id = 0
	if LevelManager.loaded_level != null:
		currently_loaded_id = LevelManager.loaded_level.level_id
	return should_be_loaded_id == currently_loaded_id
