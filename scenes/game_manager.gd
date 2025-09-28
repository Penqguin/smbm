extends Node2D

var player : Node = null

func _ready():
	# adjust path based on your scene tree
	player = get_tree().root.get_node("res://scripts/player.gd")

func get_lives() -> int:
	return player.hp if player else 0
	
func get_dashes() -> int:
	return player.currentDashes if player else 0
