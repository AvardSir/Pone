extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


var direction = 1
func change_dir():
	$Sprite2D.flip_h=!$Sprite2D.flip_h
	direction*=-1
	
func kill():
	is_alive=false
	velocity.x=0
	
func _physics_process(delta):
	velocity.x = SPEED*direction
	#$AnimatedSprite.play("walk")
	velocity.y += (gravity * delta)
	#velocity = move_and_slide(velocity, FLOOR)|
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if is_on_wall():
		change_dir( )
	# Handle Jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction #= Input.get_axis("ui_left", "ui_right")
	#if direction:
	velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
