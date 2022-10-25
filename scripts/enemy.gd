extends Area2D

onready var player_vars = get_node("/root/player_vars")

func _on_Area2D_area_entered(area):
	if area.is_in_group("player"):
		player_vars.health -= 2
