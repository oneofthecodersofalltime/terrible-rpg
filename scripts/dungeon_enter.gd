extends Area2D

func _on_dungeon_enter_area_entered(area):
	if area.is_in_group("player"):
		get_tree().change_scene("res://scenes/dungeon.tscn")
