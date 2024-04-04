extends Node3D

const MAIN_SCENE = preload("res://Scenes/Main Scene/main_scene.tscn")
@onready var high_score = $Control/VBoxContainer/Label
@onready var mesh = $MeshInstance3D2


func _ready():
	SaverLoader.load_game()
	high_score.text = "HIGH SCORE: " + str(ScoreKeeper.high_score)

func _on_button_pressed():
	get_tree().change_scene_to_packed(MAIN_SCENE)

func _on_button_2_pressed():
	get_tree().quit()

func _on_play_mouse_entered():
	const GRAPE = preload("res://assets/Fruit Models/Grape.tres")
	mesh.mesh = GRAPE

func _on_settings_mouse_entered():
	const STRAWBERRY = preload("res://assets/Fruit Models/Strawberry.tres")
	mesh.mesh = STRAWBERRY

func _on_quit_mouse_entered():
	const CHERRY = preload("res://assets/Fruit Models/Cherry.tres")
	mesh.mesh = CHERRY
