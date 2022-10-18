extends KinematicBody2D

var input_vector = Vector2.ZERO
onready var speed = 1

func _physics_process(delta):
	global_position.y += speed

func _on_Timer_timeout():
	if speed == 1:
		speed = -1
	else:
		speed = 1
