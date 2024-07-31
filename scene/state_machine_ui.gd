extends StateMachine

@export var current_level_id: int

@onready var level_loading_screen = $LevelLoadingScreen

func load_level(level_id):
	if current_level_id != level_id:
		current_level_id = level_id
		if level_id != 0:
			LevelManager.load_level(current_level_id)
		else:
			LevelManager.unload_level()
		current_state.Transitioned.emit(level_loading_screen)
		
		
