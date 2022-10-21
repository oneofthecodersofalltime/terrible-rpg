extends Area2D
onready var bullet = $Sprite
onready var reloading = 0

func _ready():
	bullet.hide()

func _on_gun_shoot():
	bullet.show()
	reloading = 1

func _physics_process(delta):
	if reloading == 1:
		global_position.x += 5

func _on_Area2D_area_entered(area):
	if area.is_in_group("boss"):
		bullet.hide()
		reloading = 0
		global_position = Vector2(-132, -13)
