extends Control



func _on_Play_pressed():
	var _scene = get_tree().change_scene("res://Game2.tscn")


func _on_Quit_pressed():
	get_tree().quit()
