extends CharacterBody2D

@export var speed = 130
@export var dashes = 3
@export var hp = 3
@export var atk = 50
@export var crit_chance = 20
@export var crit_damage = 1.5
@onready var animated_sprite = $AnimatedSprite2D

func update_animations():
	if Input.is_action_pressed("left"):
		animated_sprite.play("walk_left")
		
	elif Input.is_action_pressed("right"):
		animated_sprite.play("walk_right")
		
	elif Input.is_action_pressed("up") and Input.is_action_pressed("right") or Input.is_action_pressed("up"):
		animated_sprite.play("walk_right")
		
	elif Input.is_action_pressed("up") and Input.is_action_pressed("left"):
		animated_sprite.play("walk_right")
		
	elif Input.is_action_pressed("down") and Input.is_action_pressed("right") or Input.is_action_pressed("down"):
		animated_sprite.play("walk_right")
		
	elif Input.is_action_pressed("down") and Input.is_action_pressed("left"):
		animated_sprite.play("walk_left")
		
	else:
		animated_sprite.play("idle")

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	update_animations()

func _physics_process(delta):
	get_input()
	move_and_slide()
