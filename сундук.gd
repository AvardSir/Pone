extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("сундук_закрытый")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

const SHOT=preload("res://coin.tscn")	
const SHOT2=preload("res://coin.tscn")	
const SHOT3=preload("res://coin.tscn")	

func _on_body_entered(body):
	if "fluter" in body.name:
		if body.key>0:
			body.key-=1
			$AnimatedSprite2D.play("сундук_открытый")
			
			var shott=SHOT.instantiate()
			var shott2=SHOT2.instantiate()
			var shott3=SHOT3.instantiate()
			shott.position=$первый.global_position
			shott2.position=$второй.global_position
			shott3.position=$третий.global_position
			#shott.direction=sign($shot_position.position.x)
			
			get_parent().add_child(shott)
			get_parent().add_child(shott2)
			get_parent().add_child(shott3)
	pass # Replace with function body.
