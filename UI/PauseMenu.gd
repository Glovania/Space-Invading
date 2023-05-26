extends CanvasLayer

onready var ResumeButton = $Resume
onready var ExitButton = $Exit
onready var textRect = $TextureRect

func _ready() -> void:
	ResumeButton.visible = false
	ExitButton.visible = false
	textRect.visible = false
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused
		ResumeButton.visible = !ResumeButton.visible
		ExitButton.visible = !ExitButton.visible
		textRect.visible = !textRect.visible	
pass


func _on_Resume_pressed():
	get_tree().paused = false
	ResumeButton.visible = false
	ExitButton.visible = false
	textRect.visible = false

func _on_Exit_pressed():
	get_tree().change_scene("res://Menu/Menu.tscn")
	get_tree().paused = false
	ResumeButton.visible = false
	ExitButton.visible = false
	textRect.visible = false
