extends Area2D

onready var boss_health = 25
onready var slander = $slander
onready var health = $health

var insults = ["You egg wanker, hit me no balls!", "You stinky balled noob!", 
"Spiderman noob, shrek is better superhero!", "You are only x=0.104, y=0.082", 
"You smell like feet, i kind of like that", "I bet you don't have any parmesan"]

func _ready():
	randomize()

func _on_boss_area_entered(area):
	if area.is_in_group("player"):
		get_tree().change_scene("res://scenes/you_are_dead.tscn")
	if area.is_in_group("bullet"):
		if boss_health == 1:
			get_tree().change_scene("res://scenes/victory.tscn")
		boss_health -= 1
		health.text = "BOSS HEALTH: " + str(boss_health)

# only used for insults
func _on_Timer_timeout():
	if boss_health == 25:
		var new_insult = insults[0]
		slander.text = new_insult
	else:
		var insult_choose = randi() % insults.size()
		var new_insult = insults[insult_choose]
		slander.text = new_insult
