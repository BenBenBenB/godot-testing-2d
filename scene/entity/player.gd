extends CharacterBody2D

@export var speed: float = 300.0
@export var additional_jumps: int = 1
@export var jump_force: float = -350.0
@export var jump_time_span: float = .25
@export var coyote_time_span: float = 0.075
@export var gravity_multiplier: float = 3.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_jumping: bool = false
var jump_timer: float = 0
var airtime_timer: float = 0
var jump_counter: float = 0 # count jumps since last touching floor

@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer


func _can_jump() -> bool:
	return is_on_floor() \
		or _can_coyote_jump() \
		or _can_midar_jump()

func _can_coyote_jump() -> bool:
	return !is_jumping and airtime_timer < coyote_time_span
	
func _can_midar_jump() -> bool:
	return !is_jumping and jump_counter <= additional_jumps
	
func _can_continue_one_jump() -> bool:
	return is_jumping and jump_timer < jump_time_span and !is_on_ceiling()

func _physics_process(delta):
	_process_jump(delta)
	var direction = Input.get_axis("move_left", "move_right")
	_process_direction(delta, direction)
	_handle_animations(direction)
	move_and_slide()

func _process_direction(delta: float, direction: float):
	if direction:
		sprite_2d.flip_h = direction > 0
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

func _process_jump(delta):
	if is_on_floor():
		jump_counter = 0
		jump_timer = 0
		airtime_timer = 0
	else:
		velocity.y += gravity * delta * gravity_multiplier
		airtime_timer += delta
		
	if Input.is_action_pressed("jump"):
		if _can_continue_one_jump():
			velocity.y = jump_force
			jump_timer += delta
		elif _can_jump():
			is_jumping = true
			jump_counter += 1
			jump_timer = 0
			velocity.y = jump_force
			jump_timer += delta
	else:
		is_jumping = false

func _handle_animations(direction: float) -> void:
	if abs(direction) > 0.1 and is_on_floor():
		animation_player.play("run")
	elif not is_on_floor():
		animation_player.play("jump")
	else:
		animation_player.play("idle")
	
