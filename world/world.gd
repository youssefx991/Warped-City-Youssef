extends Node2D


func _process(delta):
	if $Player.is_dead:
		get_tree().change_scene_to_file("res://wasted_menu/wasted_menu.tscn")


func _on_ladder_body_entered(body):
	if body.name == "Player":
		print("entered area")
		body.is_climbing = true


func _on_ladder_body_exited(body):
	if body.name == "Player":
		print("exited area")
		body.is_climbing = false
