extends "res://soldado/Soldado.gd"

func _physics_process(delta):
	control(delta)
	movement_loop()
	animation_loop()

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
	
func animation_loop():
	match movedir:
		Vector2(-1,0): #left
			$Sprite.play("run_left")
		Vector2(1,0): #right
			$Sprite.play("run_right")
		Vector2(0,-1): #up
			$Sprite.play("run_up")
		Vector2(0,1): #down
			$Sprite.play("run_down")
		Vector2(-1,-1): #up left
			$Sprite.play("up_left")
		Vector2(-1,1): #down left
			$Sprite.play("down_left")
		Vector2(1,-1): #right up
			$Sprite.play("up_right")
		Vector2(1,1): #right down
			$Sprite.play("down_right")
		Vector2(0,0): #iddle
			$Sprite.play("idle")
		