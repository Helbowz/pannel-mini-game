extends Node2D

@export var enemy_prefab: PackedScene
@onready var player = get_tree().get_first_node_in_group("player")
@onready var timer = $Timer

# Distance from player to spawn enemies
@export var spawn_radius: float = 100.0 

func _on_timer_timeout():
	if player:
		spawn_enemy()

func spawn_enemy():
	# 1. Create a new enemy instance
	var new_enemy = enemy_prefab.instantiate()
	
	# 2. Get a random position in a circle around the player
	var random_angle = randf() * 2.0 * PI
	var spawn_pos = player.global_position + Vector2(cos(random_angle), sin(random_angle)) * spawn_radius
	
	# 3. Set enemy position and add to scene
	new_enemy.global_position = spawn_pos
	get_parent().add_child(new_enemy)
