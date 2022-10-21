extends Area2D

signal shoot

onready var ammo = 0


func _on_gun_area_entered(area):
	if area.is_in_group("player"):
		if ammo == 1:
			ammo = 0
			emit_signal("shoot")

func _on_Timer_timeout():
	ammo = 1
