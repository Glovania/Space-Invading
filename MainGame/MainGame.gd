extends Control

export(int) var countdownMax
var currentTimer

var movement_spped = 200
var bulletSource = preload("res://Bullet/Bullet.tscn")

# Called when the node enters the scene tree for the first time.

func _ready():
	set_process(true)
	set_physics_process(true)
	
	var name = "Autobot 1"
	var welcome = "Allios"
	var message = welcome + " " + name
	
	print(message)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _process(delta):
	if Input.is_action_just_pressed("fire"):
		var bulletInstance = bulletSource.instance()
		bulletInstance.position = Vector2(position.x, position.y-20)
		get_tree().get_root().add_child(bulletInstance)


func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		move_and_collide(Vector2(-movement_speed * delta, 0))
	if Input.is_action_pressed("ui_right"):
		move_and_collide(Vector2(movement_speed * delta, 0))
	if Input.is_action_pressed("ui_down"):
		move_and_collide(Vector2(0, movement_speed * dela))
	if Input.is_action_pressed("ui_up"):
		move_and_collide(Vector2(0, -movement_speed * delta))
