extends RigidBody3D
class_name fruit

enum fruit_id{
	cherry = 0,
	strawberry = 1,
	grapes = 2,
	dekopans = 3,
	orange = 4,
	apple = 5,
	pear = 6,
	peach = 7,
	pineapple = 8,
	melon = 9,
	watermelon = 10
}
var fruit_type:fruit_id

@onready var mesh = $mesh
@onready var fruit_collision = $"fruit collision"
@onready var area_3d_collision = $Area3D/area3D

func _ready():
	pass

func _on_body_entered(body):
	if body == self:
		return
	
	if body is fruit:
		if body.fruit_type == fruit_type:
			FruitCombiner.add_fruit(self)

func set_fruit_type(which_fruit:fruit_id):
	area_3d_collision.shape.radius = fruit_collision.shape.radius + 0.01
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
