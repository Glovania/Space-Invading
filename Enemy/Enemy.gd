extends KinematicBody2D

var health = 2
var bullet = preload("res://Bullet-Enemy/Bullet-Enemy.tscn")


func _ready():
	$EnemyArea.connect("area_entered", self, "_colliding")


func _process(delta):
	if GlobalVariables.Player == null:
		queue_free()
#	while (true):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randf_range(2.0, 28.0)
#	print("time: ",my_random_number)
	yield(get_tree().create_timer(my_random_number), "timeout")
	if GlobalVariables.enemyBulletInstanceCount < 5:
		var bulletInstance = bullet.instance()
		
		bulletInstance.position = Vector2(global_position.x, global_position.y+20)
		get_tree().get_root().add_child(bulletInstance)


func _colliding(area):
	if area.is_in_group("right"):
		get_parent().global_position.y += 10
		get_parent().speed = -170
	if area.is_in_group("left"):
		get_parent().global_position.y += 10
		get_parent().speed = 170


func reduceEnemyHealth():
	health -= 1
#	print("Health: ", health) #Check the current Enemy's Health
	if health == 0:
		queue_free()
