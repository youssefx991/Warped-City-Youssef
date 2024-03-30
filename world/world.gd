extends Node2D


func _process(delta):
	if $Player.is_dead:
		get_tree().change_scene_to_file("res://wasted_menu/wasted_menu.tscn")



