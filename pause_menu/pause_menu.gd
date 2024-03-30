extends Control

func _unhandled_input(event):
	if event.is_action_pressed('ui_cancel'):
		get_tree().paused = not get_tree().paused
		visible = not visible


func _on_resume_button_pressed():
	get_tree().paused = false
	visible = false


func _on_back_button_pressed():
	get_tree().paused = false
	visible = false
	get_tree().change_scene_to_file("res://Main_Menu/main_menu.tscn")
