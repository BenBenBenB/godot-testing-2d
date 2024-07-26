extends Node2D

@onready var player_top_down = $PlayerTopDown
var final_size: float = 2500
var mass_per_second: float = 300


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_top_down.mass < final_size:
		player_top_down.consume_mass(delta * mass_per_second)
