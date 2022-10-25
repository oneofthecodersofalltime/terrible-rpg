extends Area2D

var go = 0
onready var player_vars = get_node("/root/player_vars")

func _on_arm_2_trigger_area_entered(area):
	if area.is_in_group("player"):
		go = 1

func _on_arm2_area_area_entered(area):
	if area.is_in_group("player"):
		player_vars.health -= 2

func _on_arm_2_trigger_area_exited(area):
	if area.is_in_group("player"):
		go = 0

func _physics_process(delta):
	if go == 1:
		global_position.x -= 2
	if go == 0:
		global_position = Vector2(160, -15)
