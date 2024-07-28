extends Projectile


func _process(_delta):
	pass

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.consume_mass(-5)
