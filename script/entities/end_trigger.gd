extends Area2D

func _on_body_entered(body):
	if body.is_in_group("player"):
	# remove controls from player
	# it's not working :|
		set_process_input(false)
	# move player out of screen
	# load next level
		print("You've reached the end")
	
