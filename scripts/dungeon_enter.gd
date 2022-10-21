extends Area2D

onready var talk = 0

func _on_dungeon_enter_area_entered(area):
	if area.is_in_group("player"):
		if talk == 1:
			get_tree().change_scene("res://scenes/dungeon.tscn")

func _on_npc_area_entered(area):
	talk = 1
