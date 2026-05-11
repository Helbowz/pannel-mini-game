extends CharacterBody2D

@export var speed = 150.0
@export var damage = 1

@onready var player = get_tree().get_first_node_in_group("player")
@onready var sprite = $AnimatedSprite2D

func _physics_process(_delta):
	if player:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * speed
		move_and_slide()
		
	# 2. Rotation logic
	if velocity.length() > 0:
		# .angle() returns the angle of the movement vector
		rotation = velocity.angle()
