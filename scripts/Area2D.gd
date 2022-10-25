extends Area2D

var talk_selector = null
onready var talk = ["Imma be stroking my dick over here...", "Greetings traveller!", 
"Have they gotten a new shipment of cheesewheels at NPC No. 336913000's shop?", 
"Have you heard about the graverobber near the dungeon?",
"You seem familiar...", 
"I've heard a story about there being an gun at some anchient dungeon! Surely this isn't true.", 
"That new mayor is simply atrocious! Someone should get rid of him!", 
"Have you heard of the high elves?"]
onready var label = $Label

func _ready():
	randomize()
	label.hide()

func _on_Area2D_area_entered(area):
	if area.is_in_group("player"):
		talk_selector = randi() % talk.size()
		var final_speech = talk[talk_selector]
		label.text = final_speech
		label.show()

func _on_Area2D_area_exited(_area):
	label.hide()
