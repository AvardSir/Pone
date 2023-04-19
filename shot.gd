
extends Area2D
@export var speed := 500.0
var movement_vector := Vector2(0, -1)

func _physics_process (delta):
	global_position += movement_vector.rotated(rotation)*speed * delta
func _on_visible_on_screen_notifier_2d_screen_exited():
	pass
pass # Replace with function body.
'''extends Area2D
const speed =500
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
const SPEED = 500
var velocity = Vector2()

func _physics_process (delta):
	velocity.x = SPEED * delta
	translate(velocity)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
'''
