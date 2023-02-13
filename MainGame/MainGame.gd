extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var bulletSource = preload("res://Bullet/Bullet.tscn")

# Called when the node enters the scene tree for the first time.

func _ready():
	set_process(true)
	set_physics_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
