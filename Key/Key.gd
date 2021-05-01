extends Area


func _on_key_body_entered(body):
	if body.name == "Player":
		Global.num_key_increase()
		Global.score_key_increase()
		var SFX = get_node("/root/Game2/SFX")
		SFX.play_key_SFX()
		queue_free()
