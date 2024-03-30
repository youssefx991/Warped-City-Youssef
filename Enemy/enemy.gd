extends CharacterBody2D



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var bullet = preload("res://Bullet/bullet.tscn")
@onready var animated_sprite = $AnimatedSprite2D
func _ready():
	animated_sprite.play("Idle")
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()


func _on_death_area_body_entered(body):
	if body.name == "Bullet":
		queue_free()
		body.queue_free()
		print("death bullet")
	elif body.name == "Player":
		body.health -= 5


func _on_shoot_area_body_entered(body):
	if body.name == "Player":
		print("shoot player")
		animated_sprite.play("Shoot")
		var current_bullet = bullet.instantiate()
		if body.global_position.x < global_position.x:
			animated_sprite.flip_h = false
			$Marker2D.position.x = -25
			current_bullet.direction = -1
		elif body.global_position.x > global_position.x:
			animated_sprite.flip_h = true
			$Marker2D.position.x = 25
			current_bullet.direction = 1
			
		current_bullet.global_position = $Marker2D.global_position
		get_parent().add_child(current_bullet)


func _on_shoot_area_body_exited(body):
	if body.name == "Player":
		print("shoot out player")
		animated_sprite.play("Idle")
