extends Area2D

func _on_body_entered(body):
	#This does not work and it cannot access the collisionshape 2D directly
	#It will throw an error
	body.CollisionssShape2D.scale.x += 1
	body.CollisionShape2D.scale.y += 1
	#Think we should add to a publlic variable on the player
	#Then have the player handle the resizing on their end based on this changing number
	
	#this removes it from the scene
	queue_free()



## Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

