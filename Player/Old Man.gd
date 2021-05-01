extends KinematicBody


func _ready():
	pass


func _on_Area_body_entered(body):
	if body.name == "Player" and Global.num_key == 7:
		var _scene = get_tree().change_scene("res://Game.tscn")
	elif body.name == "Player" and Global.num_key == 0:
		var new_dialog = Dialogic.start('find0')
		add_child(new_dialog)
	elif body.name == "Player" and Global.num_key > 0 and Global.num_key < 7:
		var new_dialog = Dialogic.start('find1')
		add_child(new_dialog)
