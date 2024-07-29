extends State
class_name LevelActiveScreen
# can pause, die, or finish the level

@onready var death_screen = $"../DeathScreen"
@onready var pause_menu_screen = $"../PauseMenuScreen"
@onready var victory_screen = $"../VictoryScreen"

@onready var pause_timer: Timer = $"../../PauseTimer"

func _can_pause():
	#print(pause_timer.is_stopped())
	return pause_timer.is_stopped()

func enter():
	pass
	# todo: set up player death signal

func exit():
	pass

func update(_delta):
	if _can_pause() \
		and Input.is_action_just_pressed("pause") \
		and not Input.is_action_just_released("pause"):
		Transitioned.emit(pause_menu_screen)

func player_died():
	Transitioned.emit(death_screen)
	
func player_beat_level():
	pass # idk yet
	#LevelManager.load_next_level()
	#Transitioned.emit(...)
	
func player_won_game():
	Transitioned.emit(victory_screen)
