extends KinematicBody2D


var speed = 500


func _ready():
	GlobalVariables.BulletInstanceCount += 1
	set_physics_process(true)
	
func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(0, -speed * delta))
	if (collidedObject):
		# print(collidedObject.collider.name)
		if "Enemy" in collidedObject.collider.name:
			collidedObject.get_collider().queue_free()
		GlobalVariables.ScoringInformation["currentScore"] += 10
		
		queue_free()
		GlobalVariables.BulletInstanceCount -= 1
