extends AudioStreamPlayer
@export var eat_sfx : AudioStream
@export var hurt_sfx : AudioStream

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play_eat_sfx():
	if eat_sfx != null:
		stream = eat_sfx
		pitch_scale = randf_range(0.8, 1.2)
		bus = "SFX"
		play()
		
func play_hurt_sfx():
	if hurt_sfx != null:
		stream = hurt_sfx
		pitch_scale = randf_range(0.9, 1.1)
		bus = "SFX"
		play()
