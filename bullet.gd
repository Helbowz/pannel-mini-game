extends Area2D

@export var speed = 600

func _physics_process(delta):
	# Move in the direction the bullet is facing (X-axis)
	position += transform.x * speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	# Remove bullet when it leaves the screen to save memory
	queue_free()
