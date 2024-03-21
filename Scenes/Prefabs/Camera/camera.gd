extends Node3D

var camera_speed :float = 0.001
var movement_speed:float = 0.05

@onready var pivot_x = $pivotX
@onready var camera = $pivotX/Camera3D

const FRUIT = preload("res://Scenes/Prefabs/Fruit/fruit.tscn")
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * camera_speed)
		pivot_x.rotate_x(-event.relative.y * camera_speed)
		pivot_x.rotation.x = clamp(pivot_x.rotation.x, deg_to_rad(-70), deg_to_rad(90))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var input_dir = Input.get_vector("camera left","camera right","camera up","camera down")
	var direction = transform.basis * Vector3(input_dir.x, 0, input_dir.y)
	if direction:
		position.x += direction.x * movement_speed
		position.z += direction.z * movement_speed
	
	position.x = clamp(position.x, -3.3, 3.3)
	position.z = clamp(position.z, -3.3, 3.3)

	if Input.is_action_just_pressed("camera farther"):
		camera.position.z += 0.5
	if Input.is_action_just_pressed("camera closer"):
		camera.position.z -= 0.5
	camera.position.z = clamp(camera.position.z, 0.5, 10)
	
	if Input.is_action_just_pressed("drop fruit"):
		add_child(FRUIT.instantiate())
