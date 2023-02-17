extends KinematicBody2D

var speed = 500


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	var collideObject = move_and_collide(Vector2(0, -speed * delta))

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
# pass
