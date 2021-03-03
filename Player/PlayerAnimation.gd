extends AnimatedSprite

func _on_KinematicBody2D_animate(vel):
	if vel.x>0:
		play("move_right")
		flip_h = false
	elif vel.x<0:
		play("move_left")
		flip_h = true 
	else:
		play("idle")
