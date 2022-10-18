extends Area2D
onready var label = $Label

func _ready():
	label.hide()

func _on_npc_area_exited(area):
	label.hide()

func _on_npc_area_entered(area):
	if area.is_in_group("player"):
		label.show()
