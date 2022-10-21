extends Node2D

func _physics_process(delta):
	if Input.get_action_strength("restart") == 1:
		get_tree().change_scene("res://scenes/main.tscn")
