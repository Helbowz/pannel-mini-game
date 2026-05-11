extends CharacterBody2D

@export var speed = 150.0
@export var damage = 1

@onready var player = get_tree().get_first_node_in_group("player")
@onready var sprite = $Sprite2D

func _physics_process(_delta):
	if player:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * speed
		move_and_slide()
		
		if direction.x != 0:
			sprite.flip_h = direction.x < 0
