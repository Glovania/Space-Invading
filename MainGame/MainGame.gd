extends Control

export(int) var countdownMax
var currentTimer


func _ready():
	set_process(true)
	currentTimer = countdownMax
	$HUD/Countdown.text = str(currentTimer)
	
	for childNode in $HUD.get_children():
		if childNode is Button:
			childNode.connect("pressed", self, "_on_Button_pressed", [childNode.scene_to_load])
	
	while currentTimer > 0:
		yield(get_tree().create_timer(1.0), "timeout")
		$HUD/Countdown.text = str(currentTimer)
		currentTimer = currentTimer - 1
		print(currentTimer)
	print("Game Over")
	
	var name = "Autobot 1"
	var welcome = "Allios"
	var message = welcome + " " + name
	print(message)
	
	get_tree().change_scene("res://Menu/Menu.tscn")
	
func _process(delta):
		$HUD/CurrentScore.text = str(GlobalVariables.ScroingInformation["currentScore"])
		GlobalVariables.BulletInstanceCount = 0

func StartGameButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
