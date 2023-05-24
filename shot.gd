
extends Area2D
@export var speed = 50.0
var direction=1
var movement_vector := Vector2(-1, 0)
func _physics_process (delta):
	global_position += movement_vector.rotated(rotation)*speed*direction	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	print("in bod")
	if	"gacha" or "BOSS"  in body.name:
		body.kill() 
		queue_free() 
	elif "gacha_seat"  in body.name:
		body.kill() 
		queue_free() 
