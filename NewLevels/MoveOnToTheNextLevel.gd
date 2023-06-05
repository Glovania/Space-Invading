extends Control


func _ready():
	pass

func _on_ExitButton_pressed():
	get_tree().change_scene("res://Menu/Menu.tscn")
	
func _on_NextLevelButton_pressed():
	GlobalVariables.enemyBulletInstanceCount = 0
	get_tree().change_scene("res://NewLevels/Level_2.tscn")
