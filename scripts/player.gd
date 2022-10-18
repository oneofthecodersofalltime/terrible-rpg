extends KinematicBody2D

var velocity : Vector2 = Vector2()
var direction : Vector2 = Vector2()
var boost = 1

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

func _physics_process(delta): 
	read_input()

# direction antaa mahollisuuden lisätä spellejä jotka kastataan yhteen suuntaan.
# normalized funktio korjaa sen että menee nopeempaa diagonaalisesti

func _on_deeper_area_entered(area):
	global_position = Vector2(1230, 750)

