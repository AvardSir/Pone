extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")
	pass # Replace with function body.


func _on_body_entered(body):
	
	if "fluter" in body.name:
			
		var next_scen=preload("res://скрипты/node_2d.tscn")
		get_tree().change_scene_to_packed(next_scen)
		pass
	pass # Replace with function body.
