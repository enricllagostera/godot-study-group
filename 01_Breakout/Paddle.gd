extends Node2D

export var speed = 100
export var damp_factor = 0.8

var direction = 0
var velocity = Vector2()

func _ready():
	position = Vector2(400,500)
	pass

func _physics_process(delta):
	if Input.is_action_pressed("paddle_left"):
		direction = -1
		velocity = Vector2(direction * speed * delta, 0)
	elif Input.is_action_pressed("paddle_right"):
		direction = 1
		velocity = Vector2(direction * speed * delta, 0)
	else :
		direction = 0
		velocity *= damp_factor
	$KinematicBody2D.move_and_collide(velocity)
	pass
