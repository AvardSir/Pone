extends Node2D

var first_level=true
# Called when the node enters the scene tree for the first time.
func _ready():
	#if first_level:
	find_child("AudioStreamPlayer2D").play()
	#$AudioStreamPlayer2D.play()
		#first_level=false
	pass # Replace with function body.
func dead_charecter():
	$stats/CanvasLayer/retry.visible=true
	
func win_boss():
	$stats/CanvasLayer/Label2.visible=true
	print('kill_boss')
	#$stats/CanvasLayer.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$stats/CanvasLayer/Label.text = str($fluter.coin)
	pass		
