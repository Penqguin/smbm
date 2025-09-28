extends CharacterBody2D

@export var speed = 130
@export var hp = 3
@export var atk = 50
@export var crit_chance = 20
@export var crit_damage = 1.5
@onready var animated_sprite = $AnimatedSprite2D

#dash
@export var dash_distance = 125
@export var dash_speed = 750
@export var dashRegenTime = 2.0  # time to regenerate 1 dash bar
var dash_start_position = Vector2.ZERO
var dash_direction = Vector2.ZERO
var regenTimer = 0.0
var currentDashes = 3
var maxDashes = 3
var is_dashing = false

func update_animations():
	if Input.is_action_pressed("left"):
		animated_sprite.play("walk_left")
		
	elif Input.is_action_pressed("right"):
		animated_sprite.play("walk_right")
		
	elif Input.is_action_pressed("up") and Input.is_action_pressed("right") or Input.is_action_pressed("up"):
		animated_sprite.play("walk_right")
		
	elif Input.is_action_pressed("up") and Input.is_action_pressed("left"):
		animated_sprite.play("walk_left")
		
	elif Input.is_action_pressed("down") and Input.is_action_pressed("right") or Input.is_action_pressed("down"):
		animated_sprite.play("walk_right")
		
	elif Input.is_action_pressed("down") and Input.is_action_pressed("left"):
		animated_sprite.play("walk_left")
		
	else:
		animated_sprite.play("idle")

func playerDash(d):
	if is_dashing:
		var moveVector = dash_direction * dash_speed * d
		global_position += moveVector
		
		# stop dash if player hits something
		var collision = move_and_collide(moveVector)
		if collision:
			is_dashing = false  
			
		#distance reached
		if dash_start_position.distance_to(global_position) >= dash_distance:
			is_dashing = false 
			
	if Input.is_action_just_pressed("sprint") and currentDashes > 0 and not is_dashing:
		is_dashing = true
		currentDashes -= 1
		dash_start_position = global_position
		dash_direction = velocity.normalized()
		
	if not is_dashing and currentDashes < maxDashes:
		regenTimer += d
		if regenTimer > dashRegenTime:
			currentDashes += 1
			regenTimer = 0

func die() -> void:
	queue_free()
			
func takeDamage() -> void:
	hp -= 1
	if hp <= 0:
		die()
	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	update_animations()

func _physics_process(delta):
	get_input()
	playerDash(delta)
	move_and_slide()
