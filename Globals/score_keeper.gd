extends Node

var score:float: 
	set = set_score,
	get = get_score
var high_score:float: get = get_high_score

func get_score():
	return score
func set_score(value):
	score = value
	if score > high_score:
		high_score = score


func get_high_score():
	return high_score
