extends KinematicBody2D

var velocity = Vector2()
var gravity = 800
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
	elif(is_on_floor()):
		velocity.x = 0
		anim.play("Idle")
	elif(!is_on_floor() && (abs(velocity.y) > 0)):
		velocity.x = 0
	
	if (!is_on_floor()):
		anim.play("Jump")
		
	
	if(Input.is_action_just_pressed("ui_up") && is_on_floor()):
		velocity.y = -800
	
	

func _physics_process(delta):
	velocity.y += delta * gravity
	handleMovement()
	velocity = move_and_slide(velocity,Vector2(0,-1))

	
