extends Level

@onready var player_blackhole: PlayerBlackhole = $PlayerBlackhole
@onready var player_start = $Positions/PlayerStart

func _ready() -> void:
	super()
	player_blackhole.stop_scroll.connect(stop_scroll)
	player_blackhole.position = player_start.position

func stop_scroll():
	scroll_speed = 0
