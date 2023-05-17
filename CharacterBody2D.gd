extends CharacterBody2D

var hp=100

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	get_child(3).play()
func kill():
	hp-=1
	tp_to_point()
	if hp<0:
		get_parent().win_boss()
		#get_parent().$stats/CanvasLayer/Label.text+=30
		
		
func get_positionn(a):
	if a==1:
		#g("s%" %a)
		pass
var rage=0
const Gacha=preload("res://gacha.tscn")	
func tp_to_point():
	rage+=1
	for i in range(round(rage/25)+1):
		randomize()
		var a=int(randf_range(1,7))
		var dir=1
		if a==1 or a==2 or a==3:
				
			#$fluter.play("dead")
			#print(get_child(0))
			get_child(0).play("right_hand")
			dir=1
			#%animation_ee.play("right_hand")
			round(rage/25)
			pass
		else:
			dir=-1
			get_child(0).play("left_hand")
			#%animation_ee.play("left_hand")
			pass
		var s=str(a)
		position=get_parent().find_child(s).global_position
		s = s+s
		
		var gacha=Gacha.instantiate()
		#gacha.position=$shot_position.global_position
		gacha.position=get_parent().find_child(s).global_position
		gacha.direction=dir
		randomize()
		#var sc=int(randi_range(1,4))
		var sc=randf()
	
		while 0.2>sc or sc>0.4:
			#sc=int(randi_range(1,4))
			sc=randf()
			
		
		var sc2 = Vector2(sc,sc)
		gacha.set_scale(sc2)
		get_parent().add_child(gacha)

func _physics_process(delta):
	pass
	# Add the gravity.'''
	'''
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	'''
