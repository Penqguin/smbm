extends CharacterBody2D

@export var speed = 130
@onready var animated_sprite = $AnimatedSprite2D

func update_animations():
	if Input.is_action_pressed("left"):
		animated_sprite.play("walk")
	elif Input.is_action_pressed("right"):
		animated_sprite.play("walk")
	elif Input.is_action_pressed("up"):
		animated_sprite.play("walk")
	elif Input.is_action_pressed("down"):
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	update_animations()

func _physics_process(delta):
	get_input()
	move_and_slide()
