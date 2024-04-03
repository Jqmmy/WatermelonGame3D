extends RigidBody3D
class_name fruit

#id's that hold data (in order) like name, mesh, size of the fruit, size of combining collision and score when combined.
var fruit_id = {
	1: ["cherry", preload("res://assets/Fruit Models/Cherry.tres"), 0.25, 0.26, 1],
	2: ["strawberry", preload("res://assets/Fruit Models/Strawberry.tres"), 0.5, 0.56, 2],
	3: ["grape", preload("res://assets/Fruit Models/Grape.tres"), 0.65, 0.651, 3],
	4: ["dekopans", preload("res://assets/Fruit Models/Dekopan.tres"), 1.0, 1.01, 4],
	5: ["orange", preload("res://assets/Fruit Models/Orange.tres"), 1.25, 1.26, 5],
	6: ["apple", preload("res://assets/Fruit Models/Apple.tres"), 1.5, 1.56, 6],
	7: ["pear", preload("res://assets/Fruit Models/Pear.tres"), 1.75, 1.76, 7],
	8: ["peach", preload("res://assets/Fruit Models/Peach.tres"), 2.0, 2.01, 8],
	9: ["pineapple", preload("res://assets/Fruit Models/Pineapple.tres"), 2.25, 2.26, 9],
	10: ["melon", preload("res://assets/Fruit Models/Cantelope.tres"), 2.5, 2.51, 10],
	11: ["watermelon", preload("res://assets/Fruit Models/Watermelon.tres"), 2.75, 2.76, 15]
}
var number_id:int = 1
var fruit_type = fruit_id[1]
var live_fruit:bool = false
var start_timer:bool = true

@onready var mesh = $mesh
@onready var fruit_collision = $"fruit collision"
@onready var area_3d_collision = $Area3D/area3D
@onready var area_3d = $Area3D
@onready var timer = $Timer
@onready var audio = $AudioStreamPlayer

func _ready():
	freeze = true
	var rand_n = RandomNumberGenerator.new()
	number_id = rand_n.randi_range(1, 4)
	init_fruit_type()

func _process(_delta):
	if Input.is_action_just_pressed("drop fruit"):
		freeze = false
		top_level = true
		if start_timer:
			start_timer = false
			timer.start()
	
	for body in area_3d.get_overlapping_bodies():
		if body is fruit and body.fruit_type == fruit_type and body != self:
			var new_position = body.position + position
			body.free()
			position = new_position / 2
			linear_velocity = Vector3.ZERO
			angular_velocity = Vector3.ZERO
			ScoreKeeper.score += fruit_type[4]
			audio.play()
			for fruits in fruit_id:
				if fruits == number_id:
					number_id += 1
					init_fruit_type()
					break

func init_fruit_type():
	fruit_type = fruit_id[number_id]
	mesh.mesh = fruit_type[1]
	fruit_collision.shape.radius = fruit_type[2]
	area_3d_collision.shape.radius = fruit_type[3]

func _on_timer_timeout():
	live_fruit = true
