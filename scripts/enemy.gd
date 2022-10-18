extends Area2D

onready var player_health = 1

func _on_Area2D_area_entered(area):
	if area.is_in_group("player"):
		player_health -= 1
	if player_health == 0:
		get_tree().change_scene("res://scenes/you_are_dead.tscn")
