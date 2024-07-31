extends Level

@onready var rat = $Rat

func _ready():
	super()
	rat.player_touched_the_rat.connect(win_the_game)

func win_the_game():
	level_ended.emit(-1)
	
