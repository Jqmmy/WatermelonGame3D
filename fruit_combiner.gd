extends Node

var fruits = []

func add_fruit(the_fruit:fruit):
	fruits.append(the_fruit)
	if fruits.size() == 2:
		combine_fruit()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func combine_fruit():
	var new_position = fruits[1].position + fruits[0].position
	fruits[0].free()
	fruits[1].position = new_position / 2
	fruits[1].linear_velocity.y = 0
	fruits[1].angular_velocity.y = 0
	fruits.clear()

func _process(delta):
	pass
