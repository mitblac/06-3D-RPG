extends Area


func _ready():
	pass
	


func _on_Obstacle_body_entered(body):
	if body.name == "Player":
		Global.score_decrease()
