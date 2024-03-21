extends RigidBody3D
class_name fruit

var alive_timer:float

#id's that hold data (in order) like name, mesh, size of the fruit and size of combining collision.
var fruit_id = {
	1: ["cherry", preload("res://assets/Fruit Models/CherryMesh.tres"), 0.25, 0.26],
	2: ["strawberry", preload("res://assets/Fruit Models/Strawberry.tres"), 0.5, 0.56],
	3: ["grape", preload("res://assets/Fruit Models/Grape.tres"), 0.75, 0.76],
	4: ["dekopans", preload("res://assets/Fruit Models/dekopansMesh.tres"), 1.0, 1.01],
	5: ["orange", "mesh here", 1.25, 1.26],
	6: ["apple", "mesh here", 1.5, 1.56],
	7: ["pear", "mesh here", 1.75, 1.76],
	8: ["peach", "mesh here", 2.0, 2.01],
	9: ["pineapple", "mesh here", 2.25, 2.26],
	10: ["melon", "mesh here", 2.5, 2.51],
	11: ["watermelon", "mesh here", 2.75, 2.76]
}
var number_id:int = 1
var fruit_type = fruit_id[1]

@onready var mesh = $mesh
@onready var fruit_collision = $"fruit collision"
@onready var area_3d_collision = $Area3D/area3D

func _ready():
	init_fruit_type()

func _process(_delta):
	alive_timer += 0.001

func _on_body_entered(body):
	if body == self:
		return
	
	if body is fruit and body.fruit_type == fruit_type:
		if body.alive_timer > alive_timer:
			return
		
		var new_position = body.position + position
		body.free()
		position = new_position / 2
		
		for fruits in fruit_id:
			if fruits == number_id:
				fruit_type = fruit_id[number_id + 1]
				number_id += 1
				init_fruit_type()
				print(fruit_type)
				break

func init_fruit_type():
	mesh.mesh = fruit_type[1]
	fruit_collision.shape.radius = fruit_type[2]
	area_3d_collision.shape.radius = fruit_type[3]

