extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://world/world.tscn")

func _on_how_to_play_button_pressed():
	get_tree().change_scene_to_file("res://how_to_play_menu/how_to_play_menu.tscn")
	
func _on_controls_button_pressed():
	get_tree().change_scene_to_file("res://controls_menu/controls_menu.tscn")


func _on_quit_button_pressed():
	get_tree().quit()



