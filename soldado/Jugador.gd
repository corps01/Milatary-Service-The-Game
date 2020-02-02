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

#variabe para guardar direccion de ultima direccion
var last_dir
func animation_loop():
	match movedir:
		Vector2(-1,0): #left
			$Sprite.play("run_left")
			last_dir = "left"
		Vector2(1,0): #right
			$Sprite.play("run_right")
			last_dir = "right"
		Vector2(0,-1): #up
			$Sprite.play("run_up")
			last_dir = "up"
		Vector2(0,1): #down
			$Sprite.play("run_down")
			last_dir = "down"
		Vector2(-1,-1): #up left
			$Sprite.play("run_up_left")
			last_dir = "up_left"
		Vector2(-1,1): #down left
			$Sprite.play("run_left_down")
			last_dir = "down_left"
		Vector2(1,-1): #right up
			$Sprite.play("run_up_right")
			last_dir = "up_right"
		Vector2(1,1): #right down
			$Sprite.play("run_right_down")
			last_dir = "down_right"
		
		Vector2(0,0): #iddle switch
			match last_dir:
				"left":
					$Sprite.play("idle_left")
				"right":
					$Sprite.play("idle_right")
				"up":
					$Sprite.play("idle_up")
				"down":
					$Sprite.play("idle_down")
				"up_left":
					$Sprite.play("idle_left_up")
				"down_left":
					$Sprite.play("idle_down_left")
				"up_right":
					$Sprite.play("idle_right_up")
				"down_right":
					$Sprite.play("idle_down_right")		
		
		