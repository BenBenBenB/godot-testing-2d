extends Area2D

@onready var sprite_2d = $Sprite2D
@export var mass: float = 50

func _ready():
	sprite_2d.frame = randi_range(0, 8)

func _on_body_entered(body):
	var player = get_tree().get_first_node_in_group("Player")
	player.consume_mass(mass)
	queue_free()
