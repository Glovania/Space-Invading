extends Control


export var MainGameScene: PackedScene


func _ready():
	$MarginContainer/Layout/Main/ButtonHolder/StartGame.grab_focus()
	
	for button in $MarginContainer/Layout/Main/ButtonHolder/Quit.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])

func loadData():
	var file = File.new()
	if file.file_exists(GlobalVariables.Filesave):
		var error = file.open(GlobalVariables.Filesave, File.READ)
		if error == OK:
			var player_data = file.get_var()
			file.close()
			GlobalVariables.ScroingInformation = player_data


func _on_Start_Game_Button_pressed():
	get_tree().change_scene("res://MainGame/MainGame.tscn")
	
func _on_Options_pressed():
	get_tree().change_scene("res://Menu/Option.tscn")
	
func _on_Quit_pressed():
	get_tree().quit()
