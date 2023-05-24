extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


var direction = 1
var is_alive=true

func change_dir():
	$AnimatedSprite2D.flip_h=!$AnimatedSprite2D.flip_h
	direction*=-1

func kill():
	is_alive=false
	velocity.x=0
	$AnimatedSprite2D.play("dead")
	$colusion_gacha.disabled=true
	$colusion_gacha.queue_free()
	
const SHOT_evil=preload("res://скрипты/shot_сидящего.tscn")	

func _physics_process(delta):
		
		
		
		
	#$AnimatedSprite.play("walk")
	velocity.y += (gravity * delta)
	#velocity = move_and_slide(velocity, FLOOR)|
	if is_on_wall():
		#print(direction)
		direction*=-1
		#$fluter.flip_h=false
		$"Анимация_сидящего_врага".flip_h=!$"Анимация_сидящего_врага".flip_h
		%Node2D.position.x=-abs($shot_position.position.x)
	if is_alive:
		$AnimatedSprite2D.play("live")
		velocity.x = direction * SPEED
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
		#change_dir()
	# Handle Jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction #= Input.get_axis("ui_left", "ui_right")
	#if direction:
	
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_body_entered(body):
	if "fluter"==body.name:
		body.dead()
	pass # Replace with function body.

func _on_animated_sprite_2d_animation_finished():
	var shott=SHOT_evil.instantiate()
	
	shott.direction=sign($Node2D.position.x)
	shott.position=$Node2D.global_position
	get_parent().add_child(shott)
	pass # Replace with function body.
func shot(body):
	if body.name=="fluter":
		$AnimatedSprite2D.play("shot")
func _on___body_entered(body):
	#shot()
	pass # Replace with function body.

	#AnimatedSprite2D.play
	


func _on___body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print(body)
	print(body)
	shot(body)
	pass # Replace with function body.
