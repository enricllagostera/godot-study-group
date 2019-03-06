extends Node2D

export var speed = 50 
export var starting_direction = Vector2(1,1)

var velocity = Vector2()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	velocity = starting_direction * speed
	pass
	
func _physics_process(delta):
	var collision = $KinematicBody2D.move_and_collide(velocity * delta)
	if collision :
		print(collision.position)
		velocity = collision.normal.normalized() * speed
	pass
