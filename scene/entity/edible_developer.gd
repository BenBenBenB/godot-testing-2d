extends Area2D

signal dev_eaten()

@export var dev_name: String
@export var title: String
@export var sprite_source: String
@export var mass: float = 100

@onready var developer_sprite = $DeveloperSprite
@onready var dev_name_label = $DevNameLabel
@onready var title_label = $TitleLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	var picture = load("res://assets/%s" % sprite_source)
	developer_sprite.texture = picture
	dev_name_label.text = dev_name
	title_label.text = title


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if is_instance_of(body, PlayerBlackhole):
		body.consume_mass(mass)
	queue_free()
