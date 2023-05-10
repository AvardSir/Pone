extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func win_boss():
	$stats/CanvasLayer/Label2.visible=true
	print('kill_boss')
	#$stats/CanvasLayer.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$stats/CanvasLayer/Label.text = str($fluter.coin)
			
	pass		
