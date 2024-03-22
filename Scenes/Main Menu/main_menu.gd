extends Node3D

const MAIN_SCENE = preload("res://Scenes/Main Scene/main_scene.tscn")
@onready var high_score = $Control/Label

func _ready():
	high_score.text = str(ScoreKeeper.high_score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_packed(MAIN_SCENE)
