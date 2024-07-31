extends State
class_name LevelActiveScreen
# can pause, die, or finish the level

@onready var state_machine_ui = $".."

# states
@onready var death_screen = $"../DeathScreen"
@onready var pause_menu_screen = $"../PauseMenuScreen"
@onready var victory_screen = $"../VictoryScreen"
# nodes
@onready var pause_timer: Timer = $"../../PauseTimer"

func _ready():
	pass

func _can_pause():
	return pause_timer.is_stopped()

func enter():
	var level = LevelManager.loaded_level
	if level:
		if level.level_ended.is_connected(load_level):
			level.level_ended.disconnect(load_level)
		level.level_ended.connect(load_level)

func exit():
	pass

func update(_delta):
	if _can_pause() \
		and Input.is_action_just_pressed("pause") \
		and not Input.is_action_just_released("pause"):
		Transitioned.emit(pause_menu_screen)
		
	var player = get_tree().get_first_node_in_group("Player")
	if is_instance_of(player, PlayerBlackhole) and player.is_dead():
		player_died()
		

func player_died():
	Transitioned.emit(death_screen)
	
func load_level(level_id: int):
	state_machine_ui.load_level(level_id)
	
func player_won_game():
	Transitioned.emit(victory_screen)
