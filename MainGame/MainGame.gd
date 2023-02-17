extends Control

export(int) var countdownMax
var currentTimer


# Called when the node enters the scene tree for the first time.

func _ready():
	set_process(true)
	set_physics_process(true)
	
	var name = "Autobot 1"
	var welcome = "Allios"
	var message = welcome + " " + name
	
	print(message)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




