extends AudioStreamPlayer
#const ui_beep1 = preload("res://assets/music/UI bleep 1.wav")
#const ui_beep2 = preload("res://assets/music/UI bleep 2.wav")
@export var hover_sfx : Array[AudioStream]
@export var press_sfx : Array[AudioStream]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func play_hover_sfx():
	#Use this random pick for if you have other sfx later
	if hover_sfx.size() > 0:
		var i = randi_range(0, hover_sfx.size() - 1)
		stream = hover_sfx[i]
		bus = "SFX"
		play()


func play_press_sfx():
	if press_sfx.size() > 0:
		var i = randi_range(0, press_sfx.size() - 1)
		stream = press_sfx[i]
		bus = "SFX"
		play()
