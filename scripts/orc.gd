extends CharacterBody2D

@export var movement_speed = 100
@export var attack_range = 100

@onready var animation_player = $AnimationPlayer
@onready var player = $"."
@onready var OrcAtk = $OrcAtk

func _physics_process(delta):
	# Get the vector from the enemy to the player
	var distance_vector = player.global_position - self.global_position
	var distance = distance_vector.length()

	if distance < attack_range:
		# 1. Stop Movement: Within attack range
		velocity = Vector2.ZERO # Stop moving!
		move_and_slide()
		
		# 2. Attack: Check if it can attack
		if OrcAtk.can_attack:
			OrcAtk.attack()
			
	else:
		# 1. Movement: Move towards the player
		var direction_to_player = distance_vector.normalized() # Get direction
		velocity = direction_to_player * movement_speed # Set constant speed
		move_and_slide()
		
		animation_player.play("run")
