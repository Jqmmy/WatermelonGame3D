extends Control

@onready var h_slider = $"settings/VISUALS AND AUDIO/VBoxContainer2/HSlider"
@onready var sens = $"settings/VISUALS AND AUDIO/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/SENS"
@onready var movement = $"settings/VISUALS AND AUDIO/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer2/MOVEMENT"


#initiate settings
func _ready():
	_on_h_slider_value_changed(Settings.master_volume)
	_on_sfx_volume_value_changed(Settings.sfx_volume)
	_on_music_volume_value_changed(Settings.music_volume)
	
	_on_fullscreen_toggled(Settings.FULLSCREEN)
	_on_sens_slider_value_changed(Settings.SENSITIVITY)


func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(0, linear_to_db(value))
	Settings.master_volume = value


func _on_sfx_volume_value_changed(value):
	AudioServer.set_bus_volume_db(1, linear_to_db(value))
	Settings.sfx_volume = value


func _on_music_volume_value_changed(value):
	AudioServer.set_bus_volume_db(2, linear_to_db(value))
	Settings.music_volume = value


func _on_fullscreen_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		Settings.FULLSCREEN = true
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		Settings.FULLSCREEN = false


func _on_back_pressed():
	hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_sens_slider_value_changed(value):
	sens.text = str(value)
	Settings.SENSITIVITY = value


func _on_movement_slider_value_changed(value):
	movement.text = str(value)
	Settings.MOVEMENT_SPEED = value
