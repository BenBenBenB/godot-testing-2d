extends Level

@onready var player_blackhole: PlayerBlackhole = $PlayerBlackhole

func _ready() -> void:
	super()
	player_blackhole.stop_scroll.connect(stop_scroll)

func stop_scroll():
	scroll_speed = 0.0
