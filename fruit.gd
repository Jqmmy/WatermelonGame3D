extends RigidBody3D
class_name fruit

enum fruit_id{
	cherry = 0,
	strawberry = 1,
	grapes = 2
}
var fruit_type:fruit_id

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_body_entered(body):
	if body == self:
		return
	
	if body is fruit:
		if body.fruit_type == fruit_type:
			FruitCombiner.add_fruit(self)

