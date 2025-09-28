extends Area2D

@onready var attack_cooldown_timer = $attack_cooldown
@onready var attack_animation = $AnimationPlayer

func _process(delta):
	# Orient the weapon towards the mouse
	look_at(get_global_mouse_position())

func _input(event: InputEvent) -> void:
	# Check the global state instead of the local one
	if event.is_action_pressed("attack") and not PlayerState.is_attacking:
		melee_attack()

func melee_attack(): 
	# Set the global state to true
	PlayerState.is_attacking = true
	attack_animation.play("melee-atk")
	attack_cooldown_timer.start()

func _on_attack_cooldown_timeout() -> void:
	# Set the global state back to false
	PlayerState.is_attacking = false

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("enemy_hurtbox"):
		area.get_parent().take_damage(get_parent().atk)
