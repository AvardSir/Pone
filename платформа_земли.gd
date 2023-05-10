extends StaticBody2D
# Called when the node enters the scene tree for the first time.
func _ready():
	#print(name)
	#платформа_земли.fluter.connect(_on_down_of_platform)
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

@onready var timer=%Timer
var is_down_pressed=false
'''

func _on_down_of_platform():
	
	var fluter = get_node("fluter")
	fluter.connect("_on_down_of_platform", self, "_on_down_of_platform")
	
	
	print('fff')
	is_down_pressed=true
	timer.set_wait_time(3)
	is_down_pressed=false
	
func _on___body_entered(body):
	if "fluter" in body.name and body.is_press_down:
		#колизия_плафтормы
		$колизия_плафтормы.set_deferred("disabled",true)
		print(name)
		
		
		$Timer.start()
	 and is_down_pressed:
		$колизия_плафтормы.set_deferred("disabled",true)
		#body.up_platform(name)
		#$timer.start()

func _on_timer_timeout():
	$колизия_плафтормы.set_deferred("disabled",false)


func _on_timer_timeout():
	$колизия_плафтормы.set_deferred("disabled",false)
	pass # Replace with function body.

	'''
	
func kill():
	pass

func _on___body_entered(body):
	if "fluter" in body.name:
		body.is_on_platform=true
		#print('exit')
		#body.get_parent().is_on_platform=true
	pass # Replace with function body.


func _on___body_exited(body):
	if "fluter" in body.name:
		
		body.is_on_platform=false
		#print('exit')
		#body.get_parent().is_on_platform=false
	pass # Replace with function body.
