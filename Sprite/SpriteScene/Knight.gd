extends KinematicBody2D

var speed = 100
var movee = Vector2(0,0)
const speed_walk = 10
const speed_run = 50
const max_speed = 50
const max_speed_run = 150
const gravity = 10
const jump = -300
const maxjump = 2
var jumpcount = 0
onready var knight = $AnimatedSprite

func _physics_process(delta):
	if (not is_on_floor()):
		movee.y += gravity
	else :
		movee.y = 0
		jumpcount = 0
		movee.x = lerp(movee.x, 0, 0.2)
	
	if (Input.is_action_just_pressed("Jump") and (is_on_floor() or (jumpcount < maxjump))):
		movee.y = jump
		jumpcount += 1
		knight.animation = "Jump"
		
	if (Input.is_action_pressed("Move_Forward")):
		if (Input.is_action_pressed("Run")):
			movee.x += speed_run
			movee.x = min(movee.x, max_speed_run)
			knight.animation = "Run"
			knight.flip_h = false
		else:
			movee.x += speed_walk
			movee.x = min(movee.x, max_speed)
			knight.animation = "Walk"
			knight.flip_h = false
			
	elif (Input.is_action_pressed("Move_Back")):
		if (Input.is_action_pressed("Run")):
			movee.x -= speed_run
			movee.x = max(movee.x, -max_speed_run)
			knight.flip_h = true
			knight.animation = "Run"
		else:
			movee.x -= speed_walk
			movee.x = max(movee.x, -max_speed)
			knight.flip_h = true
			knight.animation = "Walk"
	else:
		knight.animation = "Idle"
		
	if (Input.is_action_just_pressed("Att1")):
		knight.animation = "Att1"
 
	if (is_on_ceiling()):
		movee.y = 1
	
	move_and_slide(movee,Vector2(0,-1),false,4,PI/4)
