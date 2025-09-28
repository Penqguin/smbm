extends Area2D

@onready var attack_animation = $AnimationPlayer
var can_attack: bool = true

func attack():
	if can_attack:
		attack_animation.play("attack")
		can_attack = false

func _on_attack_timer_timeout() -> void:
	can_attack = true
