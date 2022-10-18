extends Area2D

func _on_totown_area_entered(area):
	if area.is_in_group("player"):
		get_tree().change_scene("res://scenes/main.tscn")
