extends KinematicBody2D

var health = 5
export (int) var movement_speed: int = 350
var bulletSource = preload("res://Bullet/Bullet.tscn")

func _ready():
	set_process(true)
	set_physics_process(true)


func _physics_process(delta):
	playerMovement(delta)


func _process(delta):
	if GlobalVariables.AutoFiring:
		if Input.is_action_pressed("fire"):
			var bulletInstance = bulletSource.instance()
			bulletInstance.position = Vector2(position.x, position.y-88)
			get_tree().get_root().add_child(bulletInstance)
	else:
		if Input.is_action_just_pressed("fire"):
			var bulletInstance = bulletSource.instance()
			bulletInstance.position = Vector2(position.x, position.y-88)
			get_tree().get_root().add_child(bulletInstance)


func playerMovement(delta):
		if Input.is_action_pressed("ui_left"):
			if position.x > 30:
				move_and_collide(Vector2(-movement_speed * delta, 0))
		if Input.is_action_pressed("ui_right"):
			if position.x < 1250:
				move_and_collide(Vector2(movement_speed * delta, 0))
		if Input.is_action_pressed("ui_down"):
			if position.y < 1690:
				move_and_collide(Vector2(0, movement_speed * delta))
		if Input.is_action_pressed("ui_up"):
			if position.y > 600:
				move_and_collide(Vector2(0, -movement_speed * delta))


func reduceHealth():
	health -= 1
	if health == 0:
		get_tree().change_scene("res://Menu/Menu.tscn")
