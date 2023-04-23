extends Control


func _ready():
	$Layout/Main/Buttons/GameScene.grab_focus()
	
	for button in $Layout/Main/Buttons/GameScene/Quit.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])

func loadData():
	var file = File.new()
	if file.file_exists(GlobalVariables.Filesave):
		var error = file.open(GlobalVariables.Filesave, File.READ)
		if error == OK:
			var player_data = file.get_var()
			file.close()
			GlobalVariables.ScroingInformation = player_data


func _on_Button_pressed(scene_to_load):
	print("Changing Scene...")
	print(scene_to_load)
	get_tree().change_scene(scene_to_load)
