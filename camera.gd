extends Node3D

var camera_speed :float = 1.0

@onready var pivot_x = $pivotX
@onready var x_axis = $"Control/HBoxContainer/X axis"
@onready var z_axis = $"Control/HBoxContainer/VBoxContainer/Z axis"
const FRUIT = preload("res://fruit.tscn")
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("camera up"):
		pivot_x.rotate_x(-1 * camera_speed * delta)
	if Input.is_action_pressed("camera down"):
		pivot_x.rotate_x(1 * camera_speed * delta)
	if Input.is_action_pressed("camera left"):
		rotate_y(-1 * camera_speed * delta)
	if Input.is_action_pressed("camera right"):
		rotate_y(1 * camera_speed * delta)
	pivot_x.rotation.x = clamp(pivot_x.rotation.x, deg_to_rad(-70), deg_to_rad(10))
	
	position.z = z_axis.value
	position.x = x_axis.value

	if Input.is_action_just_pressed("camera farther"):
		pass

func _on_button_pressed():
	add_child(FRUIT.instantiate())
