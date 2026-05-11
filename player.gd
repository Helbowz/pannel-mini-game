extends CharacterBody2D

@export var max_speed = 600.0
@export var accel = 1500.0
@export var friction = 1500.0
@onready var sprite = $AnimatedSprite2D

var last_direction = "down" 

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
		
	update_animation(direction)
	#tell it to move
	move_and_slide()
	
func update_animation(dir):
	if dir != Vector2.ZERO:
		# Determine primary direction (Up, Down, Left, or Right)
		if abs(dir.x) > abs(dir.y):
			last_direction = "right" if dir.x > 0 else "left"
		else:
			last_direction = "down" if dir.y > 0 else "up"
		
		# Play the walking version of the direction
		sprite.play("walk_" + last_direction)
	else:
		# If standing still, play the idle version of the last direction moved
		sprite.play("idle_" + last_direction)


func _on_health_component_died():
	queue_free()
