extends Control

export(int) var countdownMax
var currentTimer


# Called when the node enters the scene tree for the first time.

func _ready():
	currentTimer = countdownMax
	
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




