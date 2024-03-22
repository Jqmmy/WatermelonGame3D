extends Node

func save_game():
	var file = FileAccess.open("res://savegame.data", FileAccess.WRITE)
	file.store_var(ScoreKeeper.get_high_score())
	file.store_var(ScoreKeeper.get_score())
	file.close()

func load_game():
	var file = FileAccess.open("res://savegame.data", FileAccess.READ)
	ScoreKeeper.high_score = file.get_var()
	file.close()
