extends Button



# Called when the node enters the scene tree for the first time.
func _ready():
	#get_tree().change_scene_to_packed(next_scen)
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
'''
extends Node2D
var next_scen = preload("res://node_2.tscn")
func_ready():
기 pass # Replace with function body.
func process (delta):
if Input.is_action_just_pressed ("ui_down"):
get_tree().change_scene_to_packed (next_scen)

'''



func _on_pressed():
	#print("new game")
	#get_tree().change_scene_to_packed(next_scen)
	var next_scen=preload("res://скрипты/node_2d.tscn")
	get_tree().change_scene_to_packed(next_scen)
	
	#get_tree().change_scene_to_file("res://скрипты/node_2d.tscn")
	pass # Replace with function body.
