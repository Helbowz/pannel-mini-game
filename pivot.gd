extends Node2D

@export var bullet_scene : PackedScene  # Drag your Bullet.tscn here in the Inspector
@onready var muzzle = $Gun/Muzzle
@onready var timer = $Gun/Timer

func _process(_delta):
	# Rotate pivot to look at the mouse cursor
	look_at(get_global_mouse_position())
	
	# Fire automatically on a timer if the mouse is held down
	if Input.is_action_pressed("fire") and timer.is_stopped():
		shoot()
		timer.start()

func shoot():
	var bullet = bullet_scene.instantiate()
	# Set the bullet to spawn at the muzzle's position and match the gun's rotation
	bullet.global_position = muzzle.global_position
	bullet.rotation = global_rotation
	# Add the bullet to the main scene tree so it doesn't move with the player
	get_tree().root.add_child(bullet)
