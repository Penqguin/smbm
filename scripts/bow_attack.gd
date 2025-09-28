extends Node2D

@onready var attack_cooldown_timer = $Attack_cooldown
@onready var attack_animation = $AnimationPlayer

func _process(delta):
	# Orient the weapon towards the mouse
	look_at(get_global_mouse_position())

func _input(event: InputEvent) -> void:
	# Check the global state instead of the local one
	if event.is_action_pressed("alt-attack") and not PlayerState.is_attacking:
		bow_attack()

func bow_attack(): 
	# Set the global state to true
	PlayerState.is_attacking = true
	attack_animation.play("Bow_attack")
	attack_cooldown_timer.start()

func _on_attack_cooldown_timeout() -> void:
	# Set the global state back to false
	PlayerState.is_attacking = false
