
extends Area2D
@export var speed = 50.0
var direction=1
var movement_vector := Vector2(-1, 0)
func _physics_process (delta):
	global_position += movement_vector.rotated(rotation)*speed*direction	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if  "BOSS" or "gacha" in body.name:
		body.kill() 
		queue_free() 
