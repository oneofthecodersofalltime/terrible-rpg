extends Area2D

onready var talk = 0
onready var label = $Label

func _ready():
	label.hide()

func _on_dungeon_enter_area_entered(area):
	if area.is_in_group("player"):
		if talk == 0:
			label.show()
		if talk == 1:
			get_tree().change_scene("res://scenes/dungeon.tscn")

func _on_npc_area_entered(_area):
	talk = 1


func _on_dungeon_enter_area_exited(area):
	if area.is_in_group("player"):
		label.hide()
