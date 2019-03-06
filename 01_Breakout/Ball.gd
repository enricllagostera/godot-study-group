extends KinematicBody2D

export var speed = 50 
export var starting_direction = Vector2(1,1)

onready var tween = $Tween

var velocity = Vector2()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	velocity = starting_direction.normalized() * speed
	pass
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		# visual fx when ball hit
		tween.interpolate_property($Visual, "scale", Vector2(0.5, 0.5), 
		Vector2(0.3,0.3), 0.4, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
		tween.start()
		
		# handles bounce logic
		if collision.collider.is_in_group("Paddle") :
			# ball is coming from the left and hits left half
			if velocity.x > 0 && collision.position.x < collision.collider.position.x :
				velocity *= -1
				return
			
			# ball is coming from the right and hits right half
			if velocity.x < 0 && collision.position.x > collision.collider.position.x :
				velocity *= -1
				return
			pass
			
		# if the ball just needs to be reflected
		var leftover = velocity.bounce(collision.normal)
		velocity = leftover.normalized() * speed
	pass