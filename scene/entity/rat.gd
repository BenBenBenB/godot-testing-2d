extends Node2D

signal player_touched_the_rat()

func _ready():
	pass 

func _process(_delta):
	pass
		
func _player_touched_the_rat():
	player_touched_the_rat.emit()

func _on_head_area_2d_body_entered(body):
	if is_instance_of(body, PlayerBlackhole):
		_player_touched_the_rat()

func _on_leg_area_2d_body_entered(body):
	if is_instance_of(body, PlayerBlackhole):
		_player_touched_the_rat()

func _on_body_area_2d_body_entered(body):
	if is_instance_of(body, PlayerBlackhole):
		_player_touched_the_rat()
