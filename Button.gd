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
res://скрипты/1уровень.tscn
var next_scen=preload("res://скрипты/node_2d.tscn")

var next_scen=preload(res://скрипты/1уровень.tscn)
'''


var bos_hp=15
func _on_pressed():
	#print("new game")
	#get_tree().change_scene_to_packed(next_scen)
	
	var next_scen=preload("res://скрипты/1уровень.tscn")
	get_tree().change_scene_to_packed(next_scen)
	
	#get_tree().change_scene_to_file("res://скрипты/node_2d.tscn")
	pass # Replace with function body.


func _on_new_game_2_pressed():
	#"res://boss.gd"=50
	#"res://boss.tscn"
	pass # Replace with function body.
