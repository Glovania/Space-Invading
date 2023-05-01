extends KinematicBody2D


signal health_updated(health)
signal killed()

export(int) var MaxHealth = 20

onready var health_bar = $"Control/HP Bar"
# onready var invulnerability_timer = $Area2D/InvulnerabilityTimer
# onready var animation = $AnimationPlayer

var movement_speed = 250
var bulletSource = preload("res://Bullet/Bullet.tscn")


func _ready():
	set_process(true)
	set_physics_process(true)

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

func _on_heath_updated(health, amount):
	health_bar.value = health

func _on_max_health_updated(max_heath):
	health_bar.max_value = max_heath
	
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		if position.x > 30:
#			animation.play("run")
			move_and_collide(Vector2(-movement_speed * delta, 0))
	if Input.is_action_pressed("ui_right"):
		if position.x < 1250:
#			animation.play("run")
			move_and_collide(Vector2(movement_speed * delta, 0))
	if Input.is_action_pressed("ui_down"):
		if position.y < 1690:
			move_and_collide(Vector2(0, movement_speed * delta))
	if Input.is_action_pressed("ui_up"):
		if position.y > 600:
			move_and_collide(Vector2(0, -movement_speed * delta))

#func damage(amount):
#	if invulnerability_timer.is_stopped():
#		invulnerability_timer.start()
#	_setHealth(health - amount)

#func kill():
#	pass 
#	
#func _setHealth(value):
#	var previousHealth = health
#	health = clamp(value, 0, MaxHealth)
#	if health != previousHealth:
#		emit_signal("health_updated", health)
#		if health == 0:
#			kill()
