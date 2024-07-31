extends Level

func _process(delta):
	if Input.is_action_pressed("pause"):
		go_to_menu()

func _on_menu_button_pressed():
	go_to_menu()

func go_to_menu():
	level_ended.emit(0)
