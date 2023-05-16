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
		else:
			GlobalVariables.enemyBulletInstanceCount -= 1
			print("Enemy Bullet: ", GlobalVariables.enemyBulletInstanceCount)
			
		if "Player" in collidedObject.collider.name:
			collidedObject.get_collider().queue_free()
			get_tree().change_scene("res://Menu/Menu.tscn")
			queue_free()
