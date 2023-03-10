extends KinematicBody2D


var movement_speed = 200
var bulletSource = preload("res://Bullet/Bullet.tscn")


func _ready():
	set_process(true)
	set_physics_process(true)

func _process(delta):
	if GlobalVariables.AutoFiring:
		if Input.is_action_pressed("fire"):
			if GlobalVariables.BulletInstanceCount > 6:
				var bulletInstance = bulletSource.instance()
				bulletInstance.position = Vector2(position.x, position.y-20)
				get_tree().get_root().add_child(bulletInstance)
				# Automatic Firing code
				yield(get_tree().create_timer(0.7),"timeout")
	elif Input.is_action_just_pressed("fire"):
		if GlobalVariables.BulletInstanceCount < 3:
			var bulletInstance = bulletSource.instance()
			bulletInstance.position = Vector2(position.x, position.y-20)
			get_tree().get_root().add_child(bulletInstance)

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		if position.x > 30:
			move_and_collide(Vector2(-movement_speed * delta, 0))
	if Input.is_action_pressed("ui_right"):
		if position.x < 1250:
			move_and_collide(Vector2(movement_speed * delta, 0))
	if Input.is_action_pressed("ui_down"):
		if position.y <1690:
			move_and_collide(Vector2(0, movement_speed * delta))
	if Input.is_action_pressed("ui_up"):
		if position.y >600:
			move_and_collide(Vector2(0, -movement_speed * delta))
