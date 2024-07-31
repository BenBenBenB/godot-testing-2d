extends Level

@onready var sprite_ben = $BenB/AnimatedSprite2D
@onready var sprite_cratylus = $Cratylus/AnimatedSprite2D
@onready var sprite_sheroine = $Sheroine/AnimatedSprite2D
@onready var sprite_tortex = $Tortex/AnimatedSprite2D
@onready var sprite_magicsmoke = $Magicsmoke/AnimatedSprite2D
@onready var background_music = $BackgroundMusic
@onready var label = $Label

func _ready():
	sprite_ben.play()
	sprite_cratylus.play()
	sprite_sheroine.play()
	sprite_tortex.play()
	sprite_magicsmoke.play()
	background_music.play()
	
func _process(_delta):
	if Input.is_action_pressed("pause"):
		go_to_menu()
	var movement = Input.get_vector("move_left", "move_right", "move_up", "move_down")	
	if not is_zero_approx(movement.length()):
		label.hide()
		
func _on_menu_button_pressed():
	go_to_menu()

func go_to_menu():
	level_ended.emit(0)
