extends KinematicBody

var gravity = -9.8
var velocity = Vector3()
var camera
var character
var anim_player


const SPEED = 6
const ACCELERATION = 3
const DE_ACCELERATION = 5

func _ready():
	anim_player = get_node("AnimationPlayer")
	character = get_node(".")
	
func _physics_process(_delta):
	
	camera = get_node("Target/Camera").get_global_transform()
	
	var dir = Vector3()
	
	var is_moving = false
	
	if(Input.is_action_pressed("forward")) and get_tree().get_current_scene().get_name() == "Game2":
		dir += -camera.basis[2]
		is_moving = true
	if(Input.is_action_pressed("back")) and get_tree().get_current_scene().get_name() == "Game2":
		dir += camera.basis[2]
		is_moving = true
	if(Input.is_action_pressed("left")) and get_tree().get_current_scene().get_name() == "Game2":
		dir += -camera.basis[0]
		is_moving = true
	if(Input.is_action_pressed("right")) and get_tree().get_current_scene().get_name() == "Game2":
		dir += camera.basis[0]
		is_moving = true
		
	dir.y = 0
	dir = dir.normalized()
	
	velocity.y += _delta * gravity
	
	var hv = velocity
	hv.y = 0
	
	var new_pos = dir * SPEED
	var accel = DE_ACCELERATION
	
	if (dir.dot(hv) > 0):
		accel = ACCELERATION
		
	hv = hv.linear_interpolate(new_pos, accel * _delta)
	
	velocity.x = hv.x
	velocity.z = hv.z
	
	velocity = move_and_slide(velocity, Vector3(0,1,0))
	
	if is_moving:
		var angle = atan2(hv.x, hv.z)
		var char_rot = character.get_rotation()
		char_rot.y = angle
		character.set_rotation(char_rot)
		
		
#	var anim_to_play = "Idle"
#
#	if is_moving:
#		anim_to_play = "Run"
#
#	var current_anim = anim_player.get_current_animation()
#	if current_anim != anim_to_play:
#		anim_player.play(anim_to_play)
	
	var speed = hv.length() / SPEED
	
	$AnimationTree.set("parameters/Idle_Run/blend_amount", speed) 
	
