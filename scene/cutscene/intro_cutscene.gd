extends Level

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_anything_pressed():
		if no_gnomes():
			level_ended.emit(1)

func no_gnomes():
	return (
		not Input.is_key_pressed(KEY_G)
		and not Input.is_key_pressed(KEY_N)
		and not Input.is_key_pressed(KEY_O)
		and not Input.is_key_pressed(KEY_M)
		and not Input.is_key_pressed(KEY_E)
	)
