extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0*1.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


var coin=0
func add_coin():
	coin+=1
var SHOT=preload("res://shot.tscn")	
#@onready var marker=$Marker2D
signal shot_shot(shot)
func _physics_process(delta):
	if Input.is_action_just_pressed("пробел"):
		var shot=SHOT.instantiate()
		shot.position=$Marker2D.global_position
		get_parent().add_child(shot)
		print('gg')
		
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("прыжок") and is_on_floor():
	
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("влево", "вправо")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	
	
	# position.x=clamp(position.x,0,1000) #ограничения по иксу


