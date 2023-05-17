extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0*2

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


var coin=0
func add_coin():
	coin+=1

#@onready var marker=$Marker2D


func dead():
	$fluter.play("dead")
	$CollisionShape2D.set_deferred("disabled",true)
	get_parent().dead_charecter()
	
	#var next_scen=preload("res://скрипты/node_2d.tscn")
	
func kill():
	pass
#@onready var timer=%Timer
var is_press_down=false
var is_on_platform=false
const SHOT=preload("res://shot.tscn")	

func _physics_process(delta):
	
	if Input.is_action_just_pressed("пробел"):
		var shott=SHOT.instantiate()
		
		shott.direction=sign($shot_position.position.x)
		shott.position=$shot_position.global_position
		get_parent().add_child(shott)
		
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("прыжок") and is_on_floor():
	
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("влево", "вправо")
	if Input.is_action_just_pressed("вниз") and is_on_platform:
		set_collision_mask_value(1,0)
	if !is_on_platform:
		set_collision_mask_value(1,1)
	if Input.is_action_just_pressed("влево"):
		$fluter.flip_h=false
		$shot_position.position.x=-abs($shot_position.position.x)
	elif Input.is_action_just_pressed("вправо"):
		$fluter.flip_h=true
		$shot_position.position.x=abs($shot_position.position.x)
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func _on_timer_timeout():
	$CollisionShape2D.set_deferred("disabled",false)
	pass # Replace with function body.
