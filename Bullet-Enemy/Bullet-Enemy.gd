extends KinematicBody2D


var speed = 500


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.enemyBulletInstanceCount += 1
	set_physics_process(true)
	
func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(0, +speed * delta * 0.4))
	if (collidedObject):
		# print("Enemy collide ",collidedObject.collider.name)
		if "Enemy" in collidedObject.collider.name:
			pass
			# collidedObject.get_collider().queue_free()
			# So that it won't kill the enemies itself
		else:
			if "Player" in collidedObject.collider.name:
				collidedObject.get_collider().queue_free()
				queue_free()
				GlobalVariables.enemyBulletInstanceCount -= 1
				get_tree().change_scene("res://Menu/Menu.tscn")
