extends Area2D

signal end_reached

func _on_body_entered(body):
	
	if body.is_in_group("player"):
		end_reached.emit()
	# remove controls from player
	# it's not working :|
		set_process_input(false)
	# move player out of screen
	# load next level
		print("You've reached the end")
	
	#doesn't work because collision2D does not detect markers
	#if body.is_in_group("spawner"):
		#body.stop()
