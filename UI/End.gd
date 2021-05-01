extends Control


func _ready():
	var start_time = Global.music_time
	$Music.play(start_time)
	var new_dialog = Dialogic.start('end')
	add_child(new_dialog)
	
func _on_Quit_pressed():
	get_tree().quit()

