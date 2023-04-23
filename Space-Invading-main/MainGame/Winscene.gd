extends Node2D


func _ready():
	GlobalVariables.ScoringInformation["highScore"].sort()

	var HighscorePosition = GlobalVariables.ScoringInformation["highScore"].bsearch(GlobalVariables.ScoringInformation["currentScore"], true)
	print("position #", HighscorePosition)

	GlobalVariables.ScoringInformation["highScore"].insert(HighscorePosition, GlobalVariables.ScoringInformation["currentScore"])
	
	GlobalVariables.ScoringInformation["highScore"].remove(0)
	
	print(GlobalVariables.ScoringInformation["highScore"])
	saveData()
	

func saveData():
	var file = File.new()
	var error = file.open(GlobalVariables.Filesave, file.WRITE)
	if error == OK:
		file.store_var(GlobalVariables.ScoringInformation)
		file.close()
		print("!!Data Saved!!")
	else :
		print("!!Data Not Saved!!")


func _on_Button_pressed():
	get_tree().change_scene("res://Menu/Menu.tscn")
