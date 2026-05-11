extends Node
class_name HealthComponent

# Signals for communication
signal health_changed(current_health)
signal died
signal damaged(amount)
signal healed(amount)

# Export stuff to sidebar for easy editing w/o messing w/ script
@export var max_health: float = 1.0
var health: float

func _ready():
	health = max_health
	# clamping health ensures that health never displays above/below a certian point
	health = clamp(health, 0, max_health)

func take_damage(amount: float):
	if health <= 0: return # Already dead
	
	health -= amount
	health = clamp(health, 0, max_health)
	
	damaged.emit(amount)
	health_changed.emit(health)
	
	print("You took damage!")
	
	if health <= 0:
		died.emit()

func heal(amount: float):
	if health <= 0: return # cant heal a dead guy
	
	health += amount
	health = clamp(health, 0, max_health)
	
	healed.emit(amount)
	health_changed.emit(health)
