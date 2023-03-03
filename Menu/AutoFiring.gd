extends CheckButton


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_AutoFiring_pressed():
	GlobalVariables.AutoFiring = pressed
	print(pressed)
