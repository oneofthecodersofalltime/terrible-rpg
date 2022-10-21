extends Area2D

signal testing

onready var tilemap = $TileMap
onready var tilemap2 = $TileMap2
onready var shovel = $Shovel
onready var done = 0

func _ready():
	tilemap2.hide()
	shovel.hide()

func _on_Area2D_area_entered(area):
	if area.is_in_group("player"):
		if Input.get_action_strength("ui_accept") and done == 0:
			done += 1
			$Timer.start()
			shovel.show()
			tilemap.hide()
			tilemap2.show()
			emit_signal("testing")

func _on_Timer_timeout():
	if done == 2:
		get_tree().change_scene("res://scenes/boss_arena.tscn")
	shovel.hide()
	done += 1
	$Timer.start()
	
