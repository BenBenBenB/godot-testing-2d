extends Area2D

signal dev_eaten()

@export var dev_name: String
@export var title: String
@export var mass: float = 100

@onready var dev_name_label = $Splitter/DevNameLabel
@onready var title_label = $Splitter/TitleLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	dev_name_label.text = dev_name
	title_label.text = title


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_body_entered(body):
	if is_instance_of(body, PlayerBlackhole):
		body.consume_mass(mass)
	queue_free()
