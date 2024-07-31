extends StateMachine

@export var current_level_id: int

@onready var main_menu_screen = $MainMenuScreen
@onready var level_loading_screen = $LevelLoadingScreen
@onready var level_active_screen = $LevelActiveScreen
@onready var death_screen = $DeathScreen
@onready var pause_menu_screen = $PauseMenuScreen
@onready var victory_screen = $VictoryScreen
@onready var credits_screen = $CreditsScreen
@onready var settings_screen = $SettingsScreen

func load_level(level_id):
	if current_level_id != level_id:
		current_level_id = level_id
		if level_id != 0:
			LevelManager.load_level(current_level_id)
		else:
			LevelManager.unload_level()
		current_state.Transitioned.emit(level_loading_screen)
		
		
