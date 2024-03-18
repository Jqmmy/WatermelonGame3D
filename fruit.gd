extends RigidBody3D
class_name fruit

var alive_timer:float

#id's that hold data (ine order) like name, mesh and size of the fruit
var fruit_id = {
	fruit1 = ["cherry", "will have mesh info here", "size of the fruit here"],
	fruit2 = ["strawberry"],
	fruit3 = ["grapes"],
	fruit4 = ["dekopans"],
	fruit5 = ["orange"],
	fruit6 = ["apple"],
	fruit7 = ["pear"],
	fruit8 = ["peach"],
	fruit9 = ["pineapple"],
	fruit10 = ["melon"],
	fruit11 = ["watermelon"]
}
var fruit_type

@onready var mesh = $mesh
@onready var fruit_collision = $"fruit collision"
@onready var area_3d_collision = $Area3D/area3D

func _ready():
	init_fruit_type()
	print(area_3d_collision.shape.radius)
	
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
			print(fruit_id[1])

func init_fruit_type():
	area_3d_collision.shape.radius = fruit_collision.shape.radius + 0.1
	match fruit_type:
		fruit_id.cherry:
			pass
		fruit_id.strawberry:
			pass
		fruit_id.grapes:
			pass
		fruit_id.dekopans:
			pass
		fruit_id.orange:
			pass
		fruit_id.apple:
			pass
		fruit_id.pear:
			pass
		fruit_id.peach:
			pass
		fruit_id.pineapple:
			pass
		fruit_id.melon:
			pass
		fruit_id.watermelon:
			pass
