extends CharacterBody2D

@export var max_speed = 600.0
@export var accel = 1500.0
@export var friction = 1500.0

func _physics_process(delta):
	#direction we move
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	#target velocity (man on the internet told me to do this)
	var target_velocity = direction * max_speed
	
	#accelerate/decelerate
	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(target_velocity, accel * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		
	#tell it to move
	move_and_slide()
