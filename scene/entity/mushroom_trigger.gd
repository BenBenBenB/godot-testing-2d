extends Area2D
@export var camera : Camera2D
@export var marker : Node2D
@onready var triggered : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body : CharacterBody2D):
	if !triggered:
		camera.move_to_mushroom(marker.position)
		#print("You found the secret Mush-room!")
		triggered = true
