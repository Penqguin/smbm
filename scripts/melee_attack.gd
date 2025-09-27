extends Area2D

@onready var attack_cooldown_timer = $attack_cooldown
@onready var attack_animation = $AnimationPlayer
@export var can_attack = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack") and can_attack:
		melee_attack()

func melee_attack(): 
	can_attack = false
	attack_animation.play("melee-atk")
	attack_cooldown_timer.start()

func _on_attack_cooldown_timeout() -> void:
	can_attack = true

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("enemy_hurtbox"):
		area.get_parent() #take damage
