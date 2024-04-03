extends Node3D

@onready var death_ui = $"Death box/Death UI"

func _on_death_box_body_entered(body):
	if body is fruit:
		if body.live_fruit:
			SaverLoader.save_game()
			Engine.time_scale = 0
			death_ui.show()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_button_pressed():
	Engine.set_time_scale(1.0)
	ScoreKeeper.score = 0
	get_tree().reload_current_scene()

func _on_button_2_pressed():
	get_tree().quit()
