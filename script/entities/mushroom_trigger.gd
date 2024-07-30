extends Area2D
@export var camera: Camera2D
@export var marker: Node2D
@onready var triggered: bool = false

signal found_mush_room

func _on_body_entered(body):
	if body.is_in_group("player"):
		if !triggered:
			found_mush_room.emit()
			camera.move_to_mushroom(marker.position)
			#print("You found the secret Mush-room!")
			triggered = true
