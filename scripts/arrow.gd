extends Area2D

var speed = 750

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.take_damage((get_parent().atk)*2)
	queue_free()
