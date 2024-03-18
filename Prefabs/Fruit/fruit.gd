extends RigidBody3D
class_name fruit

var alive_timer:float

#id's that hold data (in order) like name, mesh, size of the fruit and size of combining collision.
var fruit_id = {
	"fruit1": ["cherry", "mesh here", 0.25, 0.26],
	"fruit2": ["strawberry", "mesh here", 0.5, 0.56],
	"fruit3": ["grapes", "mesh here", 0.75, 0.76],
	"fruit4": ["dekopans", "mesh here", 1.0, 1.01],
	"fruit5": ["orange", "mesh here", 1.25, 1.26],
	"fruit6": ["apple", "mesh here", 1.5, 1.56],
	"fruit7": ["pear", "mesh here", 1.75, 1.76],
	"fruit8": ["peach", "mesh here", 2.0, 2.01],
	"fruit9": ["pineapple", "mesh here", 2.25, 2.26],
	"fruit10": ["melon", "mesh here", 2.5, 2.51],
	"fruit11": ["watermelon", "mesh here", 2.75, 2.76]
}
var fruit_type = fruit_id.fruit1:
	set(value):
		fruit_type = value
		init_fruit_type()

@onready var mesh = $mesh
@onready var fruit_collision = $"fruit collision"
@onready var area_3d_collision = $Area3D/area3D

func _process(_delta):
	alive_timer += 0.001

func _on_body_entered(body):
	if body == self:
		return
	
	if body is fruit:
		if body.fruit_type == fruit_type:
			if body.alive_timer > alive_timer:
				return
			var new_position = body.position + position
			body.free()
			position = new_position / 2

func init_fruit_type():
	#mesh.mesh = fruit_type[1]
	fruit_collision.shape.radius = fruit_type[2]
	area_3d_collision.shape.radius = fruit_type[3]
