extends Node2D

@onready var attack_cooldown_timer = $Attack_cooldown
@onready var attack_animation = $AnimationPlayer
@export var can_attack = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("alt-attack") and can_attack:
		bow_attack()

func bow_attack(): 
	can_attack = false
	attack_animation.play("Bow_attack")
	attack_cooldown_timer.start()




func _on_attack_cooldown_timeout() -> void:
	can_attack = true
