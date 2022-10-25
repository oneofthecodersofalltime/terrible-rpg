extends KinematicBody2D

var velocity : Vector2 = Vector2()
var direction : Vector2 = Vector2()
var boost = 1
var cooldown = 0

onready var hp_hud = $health_hud
onready var player_vars = get_node("/root/player_vars")
onready var health = player_vars.health
onready var gold = player_vars.gold

func read_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		direction = Vector2(0, -1)
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		direction = Vector2(0, 1)
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		direction = Vector2(-1, 0)
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		direction = Vector2(1, 0)
	if Input.get_action_strength("boost"):
		boost = 1.5
	else:
		boost = 1
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * 200 * boost)

func _physics_process(_delta): 
	read_input()
	cooldown += 1
	if cooldown == 60:
		cooldown = 0
		hp_hud.text = "HEALTH: " + str(health) + "\n GOLD: " + str(gold) 
		if player_vars.health == 0:
			get_tree().change_scene("res://scenes/you_are_dead.tscn")


# direction antaa mahollisuuden lisätä spellejä jotka kastataan yhteen suuntaan.
# normalized funktio korjaa sen että menee nopeempaa diagonaalisesti

func _on_deeper_area_entered(_area):
	global_position = Vector2(1230, 750)

