extends Area2D

func _on_boss_minion_area_entered(area):
	if area.is_in_group("player"):
		get_tree().change_scene("res://scenes/you_are_dead.tscn")
	if area.is_in_group("wall"):
		queue_free()

func _physics_process(delta):
	global_position.x -= 2.5
