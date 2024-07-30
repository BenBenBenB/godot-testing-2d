extends State
class_name LevelActiveScreen
# can pause, die, or finish the level

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


func enter(prev_state = null):
	var level = get_tree().get_first_node_in_group("level")
	if level and level.won_entire_game \
		and not level.won_entire_game.is_connected(player_won_game):
		level.won_entire_game.connect(player_won_game)

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
	
func player_beat_level():
	pass # idk yet
	#LevelManager.load_next_level()
	#Transitioned.emit(...)
	
func player_won_game():
	Transitioned.emit(victory_screen)
