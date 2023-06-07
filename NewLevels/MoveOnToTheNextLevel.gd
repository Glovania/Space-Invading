extends Control


func _on_ExitButton_pressed():
	get_tree().change_scene("res://Menu/Menu.tscn")
	
func _on_NextLevelButton_pressed():
#	GlobalVariables.enemyBulletInstanceCount = 0
	GlobalVariables.Player == null
	get_tree().change_scene("res://NewLevels/Level_2.tscn")
