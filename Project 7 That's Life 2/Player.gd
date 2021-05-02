extends KinematicBody2D

var velocity = Vector2()
onready var anim = $Player/AnimationPlayer
onready var sprite = $Player

func _ready():
	pass # Replace with function body.


func handleMovement():

	if(Input.is_action_pressed("ui_right")):
		velocity.x = 200
		sprite.flip_h = true
		anim.play("Walk")
	elif(Input.is_action_pressed("ui_left")):
		velocity.x = -200
		sprite.flip_h = false
		anim.play("Walk")
	else:
		velocity.x = 0
		anim.play("Idle")
		
	
	if(Input.is_action_just_pressed("ui_up")):
		velocity.y = -200
	
	

func _physics_process(delta):
	velocity.y = 400
	handleMovement()
	velocity = move_and_slide(velocity)

	
