extends Node

var score = 0
var num_key = 0
var music_time = 0

func _unhandled_input(_event):
	if Input.is_action_just_pressed("menu"):
		get_tree().quit()
		
func score_decrease():
	score = score - 1
	var UI = get_node("/root/Game2/UI")
	UI.update_score()
	print(score)
	
func score_key_increase():
	score += 10
	var UI = get_node("/root/Game2/UI")
	UI.update_score()
	print(score)

func num_key_increase():
	num_key += 1
	print(num_key)
	if num_key == 1:
		var new_dialog = Dialogic.start('key1')
		add_child(new_dialog)
	if num_key == 2:
		var new_dialog = Dialogic.start('key2')
		add_child(new_dialog)
	if num_key == 3:
		var new_dialog = Dialogic.start('key3')
		add_child(new_dialog)
	if num_key == 4:
		var new_dialog = Dialogic.start('key4')
		add_child(new_dialog)
	if num_key == 5:
		var new_dialog = Dialogic.start('key5')
		add_child(new_dialog)
	if num_key == 6:
		var new_dialog = Dialogic.start('key6')
		add_child(new_dialog)
	if num_key == 7:
		var new_dialog = Dialogic.start('key7')
		add_child(new_dialog)
