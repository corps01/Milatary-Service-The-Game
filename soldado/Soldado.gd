extends KinematicBody2D

signal health_changed
signal dead

export (PackedScene) var Bullet
export (int) var speed
export (float) var gun_cooldown
export (int) var health

var movedir = Vector2(0,0)
var can_shoot = true
var alive = true

func _ready():
	$Tiempo_Pistola.wait_time = gun_cooldown
func control(delta):
	pass
func _physics_process(delta):
	if not alive:
		return
	control(delta)
	move_and_slide(movedir)