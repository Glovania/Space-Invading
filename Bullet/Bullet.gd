extends KinematicBody2D

var speed = 500


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.BulletInstanceCount += 1
	set_physics_process(true)
	
func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(0, -speed * delta))
	if (collidedObject):
		print(collidedObject.collider.name)
		if "Enemy" in collidedObject.collider.name:
			collidedObject.get_collider().queue_free()
		GlobalVariables.ScroingInformation["currentScore"] += 10
		GlobalVariables.BulletInstanceCount -= 1
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
# pass
