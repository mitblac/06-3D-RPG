extends Spatial

func _ready():
	var new_dialog = Dialogic.start('conversation')
	add_child(new_dialog)
	
func end_function():
	var _scene = get_tree().change_scene("res://UI/End.tscn")

func _physics_process(_delta):
		var start_time = $Music.get_playback_position()
		Global.music_time = start_time
		

