extends Area2D

@onready var attack_animation = $AnimationPlayer
var can_attack: bool = true

func attack():
	if can_attack:
		attack_animation.play("attack")
		can_attack = false

func _on_attack_timer_timeout() -> void:
	can_attack = true

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("player_hurtbox"):
		area.get_parent().take_damage(1) # Or whatever damage
