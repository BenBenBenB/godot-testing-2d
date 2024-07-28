extends Node2D

@export var projectile: PackedScene
@export var shot_speed: float = 10.0
@export var shots_per_second: float = 4.0
@export var rotation_rate: float = 45.0 * PI / 180.0

@onready var bullet_spawn_point = $ProjectileSpawn
@onready var shot_timer = $ShotTimer

func _ready():
	var shot_period: float = 1 / shots_per_second
	shot_timer.set_wait_time(shot_period)
	shot_timer.start()

func _on_shot_timer_timeout():
	shoot()
	pass
	
func shoot():
	var bullet: Projectile = projectile.instantiate()
	owner.add_child(bullet)
	bullet.transform = bullet_spawn_point.global_transform


