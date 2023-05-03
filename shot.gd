
'''
extends Area2D
@export var speed := 500.0
var movement_vector := Vector2(0, -1)

func _physics_process (delta):
	global_position += movement_vector.rotated(90)*speed * delta
	print('i exist!!!')
func _on_visible_on_screen_notifier_2d_screen_exited():
	
	queue_free()
pass # Replace with function body.

'''


'''
extends Area2D
const speed =500
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
const SPEED = 500
var velocity = Vector2()

func _physics_process (delta):
	#print('i exist!!!')
	velocity.x = SPEED * delta
	translate(velocity)
	print(position)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	print('i DONNNT exist!!!')
	queue_free()
'''

extends Area2D
@export var speed = 50.0
var direction=1
var movement_vector := Vector2(-1, 0)
func _physics_process (delta):
	#movement_vector=Vector2(1,0)
	#if $fluter.flip_h==false:
	#	global_position += movement_vector.rotated(rotation)*speed*-1
	#else:
	#	global_position += movement_vector.rotated(rotation)*speed
	
	global_position += movement_vector.rotated(rotation)*speed*direction	
func _on_visible_on_screen_notifier_2d_screen_exited():
	#print('i DONNNT exist!!!')
	queue_free()


func _on_body_entered(body):
	if "gacha" in body.name:
		body.kill()
	queue_free()
	pass # Replace with function body.
