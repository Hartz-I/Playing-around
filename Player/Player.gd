extends KinematicBody2D

var vel = Vector2(0,0)

const SPEED = 1000
const GRAVITY = 200
const UP = Vector2(0,-1)
const JUMP_FORCE = 2000
const FALL_LIMIT = 600

signal animate

func _physics_process(delta):
	move()
	animate()
	apply_gravity()
	jump()
	
	death()
	
	move_and_slide(vel , UP)
	
func move():
	if Input.is_action_pressed("left"):
		vel.x = -SPEED
	elif Input.is_action_pressed("right"):
		vel.x = SPEED
	else:
		vel.x = 0
		

func animate():
	emit_signal("animate", vel)

func apply_gravity():
	
	
	if is_on_floor():
		vel.y = 0
	else:
		vel.y += GRAVITY
		
func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y -= JUMP_FORCE
		
func death():
	if position.y > 600:
		get_tree().quit()
	
