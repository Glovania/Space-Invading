extends Node2D

func _ready():
	#Sorts the array
	GlobalVariables.ScoringInformation["highScore"].sort()
	
	# Searches the array for the value, or the position in the array where it will "fit".
	var highScorePosition = GlobalVariables.ScoringInformation["highScore"].bsearch(GlobalVariables.ScoringInformation["currentScore"], true)
	print("position #", highScorePosition)
	
	# Inserts the value into the array at the correct position.
	GlobalVariables.ScoringInformation["highScore"].insert(highScorePosition, GlobalVariables.ScoringInformation["currentScore"])
	
	# Removes the first (and lowest) score.
	GlobalVariables.ScoringInformation["highScore"].remove(0)
	
	# Debugging.
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
