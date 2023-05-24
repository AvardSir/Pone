extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -400.0

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
	$CollisionShape2D.disabled=true
	$CollisionShape2D.queue_free()
	
const SHOT_evil=preload("res://скрипты/shot_сидящего.tscn")	

func _physics_process(delta):
		
	#$AnimatedSprite.play("walk")
	velocity.y += (gravity * delta)
	#velocity = move_and_slide(velocity, FLOOR)|
	if is_on_wall():
		
		direction*=-1
		$AnimatedSprite2D.flip_h=!$AnimatedSprite2D.flip_h
		var sc2 = Vector2(direction,direction)
		$space_for_player.set_scale(sc2)
	if is_alive and !is_shot:
		$AnimatedSprite2D.play("live")
		velocity.x = direction * SPEED
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	move_and_slide()


func _on_area_2d_body_entered(body):
	
	if "fluter"==body.name:
		body.dead()
	pass # Replace with function body.
'''
func _on___body_entered(body):
	if body.name=="fluter":
		$AnimatedSprite2D.play("shot")
	pass # Replace with function body.

	#AnimatedSprite2D.play
	'''

var is_shot=false
func shot(body):
	if "fluter" in body.name:

		$AnimatedSprite2D.play("shot")
		is_shot=true
		#body.dead()
func _on_animated_sprite_2d_animation_finished():
	if is_alive and is_shot:
			
		var shott=SHOT_evil.instantiate()
		
		shott.direction=direction
		shott.position=$Node2D.global_position
		get_parent().add_child(shott)
		is_shot=false
		pass # Replace with function body.

func _on_area_2d_2_body_entered(body):
	if "fluter" in body.name:
		shot(body)
		#body.dead()
	pass # Replace with function body.


func _on___body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print(body)
	print(body)
	shot(body)
	pass # Replace with function body.
