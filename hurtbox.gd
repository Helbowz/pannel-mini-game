class_name HurtBox
extends Area2D


signal took_damage(damage: int)


var health: HealthComponent


func ready():
	connect("area", _on_area_entered)


func _on_area_entered(hitbox: HitBox) -> void:
	if hitbox != null:
		print("Hurtbox contacted Hitbox!")
		health.health -= hitbox.damage
		took_damage.emit(hitbox.damage)
