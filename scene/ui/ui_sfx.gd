extends AudioStreamPlayer
@export var hover_sfx : Array[AudioStream]
@export var press_sfx : Array[AudioStream]



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
