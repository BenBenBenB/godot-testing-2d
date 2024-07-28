extends Area2D
class_name Projectile

@export var speed: float = 25.0

func _physics_process(_delta):
	position += transform.x * speed
