extends CheckButton


func _ready():
	pass


func _on_AutoFiring_pressed(button_pressed):
	GlobalVariables.AutoFiring = button_pressed
	print(pressed)
