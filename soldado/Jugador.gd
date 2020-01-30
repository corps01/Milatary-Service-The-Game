extends "res://soldado/Soldado.gd"

func _physics_process(delta):
	control(delta)
	movement_loop()

func control(delta):
	var LEFT = Input.is_action_pressed('left')
	var RIGHT = Input.is_action_pressed('right')
	var UP = Input.is_action_pressed('foward')
	var DOWN = Input.is_action_pressed('backward')
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
	
func movement_loop():
	var motion = movedir.normalized() * speed 
	move_and_slide(motion, Vector2(0,0))