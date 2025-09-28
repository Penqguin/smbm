extends Node2D

func _on_start_pressed() -> void:
	print("Clicked Start")
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_credits_pressed() -> void:
	print("Clicked exit")
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
	
func _on_exit_pressed() -> void:
	print("Clicked exit")
	get_tree().quit()
