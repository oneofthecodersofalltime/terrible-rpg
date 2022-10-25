extends Node2D


# this shit makes day night possible
onready var day_night = $CanvasModulate
onready var time = 0.5
onready var stop = 0

func _physics_process(_delta):
	if Input.get_action_strength("restart") == 1:
		get_tree().change_scene("res://scenes/main.tscn")

# this whole chunk is for deciding how long days should be
	if time >= 0.9 and stop == 0:
		stop = 1
	elif stop == 1 and time > 0:
		time -= 0.0005
	elif time <= 0:
		stop = 0
	if stop == 0:
		time += 0.0005
	print(time)
# this actually does the final change
	var day_or_night = Color(time,time,time)
	day_night.set_color(day_or_night)
	
# func _ready():
# 	get_tree().change_scene("res://scenes/boss_arena.tscn")
