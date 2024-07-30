extends Node2D

@onready var player_blackhole = $PlayerBlackhole
@onready var earf = $Earf
@onready var start_timer = $StartTimer
var final_scale: float = 7.5
var scale_per_second: float = 1.0


func _ready():
	player_blackhole.dead = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not start_timer.is_stopped():
		var deltaScale = 0.5 * delta
		player_blackhole.scale += Vector2(deltaScale, deltaScale)
		return
	if player_blackhole.scale.x < final_scale:
		var deltaScale = scale_per_second * delta
		player_blackhole.scale += Vector2(deltaScale, deltaScale)
	else:
		earf.visible = false
