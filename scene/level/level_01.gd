extends Level

@onready var player_blackhole: PlayerBlackhole = $PlayerBlackhole
@onready var player_start = $Positions/PlayerStart
@onready var camera_2d = $Camera2D

func _ready() -> void:
	super()
	player_blackhole.stop_scroll.connect(stop_scroll)
	if not OS.is_debug_build():
		player_blackhole.position = player_start.position
	camera_2d.position = player_blackhole.position

func stop_scroll():
	scroll_speed = 0

func _on_end_trigger_box_body_entered(body):
	if body.is_in_group("player"):
		completed_level.emit(2)
