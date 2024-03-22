extends Node3D

func _on_death_box_body_entered(body):
	if body == fruit:
		print("dead")
