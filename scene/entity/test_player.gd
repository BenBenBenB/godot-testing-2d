extends CharacterBody2D


var speed : int = 100
var size = 1.0

func get_input():
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_dir * speed


func eat_food(food_value: float):
	size += food_value
	$CollisionShape2D.scale = Vector2(size,size)

func _process(_delta):
	pass

func _physics_process(delta):
	get_input()
	move_and_slide()
	
	#These are the 3 attributes I can access in code
	#Seems impossible to access a lot of the specific attributes in the particle emitter
	#If this is too jank to fix, we'll just scale the entire player up and call it a day
	if Input.is_key_pressed(KEY_C):
		#print($CollisionShape2D.scale)
		#print($GPUParticles2D.lifetime)
		#print($GPUParticles2D.amount)
		$CollisionShape2D.scale.x += 1
		$CollisionShape2D.scale.y += 1
		$GPUParticles2D.lifetime += 1
		$GPUParticles2D.amount += 10
	
	if Input.is_key_pressed(KEY_X):
		$CollisionShape2D.scale.x -= 1
		$CollisionShape2D.scale.y -= 1
		$GPUParticles2D.lifetime -= 1
		$GPUParticles2D.amount -= 10

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
## Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#
#
#func _physics_process(delta):
	## Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
