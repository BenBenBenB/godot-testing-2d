class_name Spawner
extends Marker2D

@export var spawn : PackedScene
@export var spawn_rect : Vector2 = Vector2(0.0, 0.0)
@export var spawn_radius : float = 0.0

@export var min_spawn_cooldown : float = 1.0
@export var max_spawn_cooldown : float = 1.0

@export var spawn_freq : int = 1

@onready var timer = $Timer

#spawns at spawner position
func point_spawn():
	var spawned = spawn.instantiate()
	owner.add_child(spawned)
	spawned.global_position = global_position
	return spawned

func rect_spawn():
	var spawned = spawn.instantiate()
	owner.add_child(spawned)
	spawned.global_position.x = randf_range(global_position.x - spawn_rect.x, global_position.x + spawn_rect.x)
	spawned.global_position.y = randf_range(global_position.y - spawn_rect.y, global_position.y + spawn_rect.y)
	return spawned

func circle_spawn():
	var spawned = spawn.instantiate()
	owner.add_child(spawned)
	
	var radial_offset = Vector2.RIGHT.rotated(randf_range(0.0, TAU))
	radial_offset *= randf_range(0.0, spawn_radius)
	spawned.global_position = global_position + radial_offset
	
	return spawned

func start_spawn_cooldown():
	timer.start(randf_range(min_spawn_cooldown, max_spawn_cooldown))
	
	
func stop_spawning():
	timer.stop()
	
