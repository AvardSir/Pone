extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_retry_button_pressed():
	print(get_parent())
	#var parentt=get_parent()
	#var next_scen=preload("res://скрипты/node_2d.tscn")
	#get_tree().change_scene_to_packed(next_scen)
	#parentt.queue_free()
	get_tree().reload_current_scene()
	#print(get_tree().unload_current_scene())
	#get_tree().unload_current_scene() #ВЫЙТИ ИЗ ИГРЫ 
	#get_parent().get_tree().reload_current_scene()
	#get_tree().change_scene_to_file("res://скрипты/node_2d.tscn")
	'''
	var next_scen=preload("res://меню.tscn")
	get_parent().queue_free()
	get_tree().change_scene_to_packed(next_scen)
	
	next_scen=preload("res://скрипты/node_2d.tscn")
	get_tree().change_scene_to_packed(next_scen)
	print('ggg')
	
	pass # Replace with function body.'''

	pass # Replace with function body.
