extends Control

@export var default_master_volume:float = 5.0
@onready var h_slider = $"settings/VISUALS AND AUDIO/VBoxContainer2/HSlider"

func _ready():
	_on_h_slider_value_changed(default_master_volume)
	h_slider.value = default_master_volume

func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(0, linear_to_db(value))
