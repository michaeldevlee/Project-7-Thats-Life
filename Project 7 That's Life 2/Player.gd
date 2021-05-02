extends KinematicBody2D

var velocity = Vector2()
var gravity = Vector2()

func _ready():
	pass # Replace with function body.


func handleMovement():
	velocity = Vector2()
	if(Input.is_action_pressed("ui_right")):
		velocity.x += 100
	if(Input.is_action_pressed("ui_left")):
		velocity.x -= 100
	

func _physics_process(delta):
	gravity.y *= 100
	handleMovement()
	velocity = move_and_slide(velocity)
