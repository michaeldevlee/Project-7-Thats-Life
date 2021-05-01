extends Node2D

var Beanstalk = load("res://Beanstalk.tscn")
var LeftLeaf = load("res://LeftLeaf.tscn")
var RightLeaf = load("res://RightLeaf.tscn")

func _ready():
	# Get size of window
	var windowSize = get_viewport_rect().size
	var windowX = windowSize.x
	# Incorrect ratio, but assigns x position to each beanstalk
	# TOO LAZY TO DO THE PRECISE MATH, SOMEONE DO PLS
	var oneX = windowX / 2 + 700
	var threeX = windowX / 2 + 100
	var twoX = windowX / 32

	for n in range(-5400, 5400, 540):
		createBeanstalk(oneX, n)
		createBeanstalk(twoX, n)
		createBeanstalk(threeX, n)

func createBeanstalk(posX, posY):
	var beanstalkInstance = Beanstalk.instance()
	var scale = Vector2(3, 3)
	beanstalkInstance.set_scale(scale)
	beanstalkInstance.set_name("beanstalk")
	beanstalkInstance.global_position.x = posX
	beanstalkInstance.global_position.y = posY
	add_child(beanstalkInstance)
	
	# adds a left or right leaf with 50% chance each
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var randomNum = int(round(rng.randf_range(0, 1)))
	if randomNum == 1:
		createLeftLeaf(posX - 145, posY / 2)
	else:
		createRightLeaf(posX + 150, posY / 2)

func createLeftLeaf(leafX, leafY):
	var leftLeafInstance = LeftLeaf.instance()
	var scale = Vector2(4, 4)
	leftLeafInstance.set_scale(scale)
	leftLeafInstance.set_name("leftLeaf")
	leftLeafInstance.global_position.x = leafX
	leftLeafInstance.global_position.y = leafY
	add_child(leftLeafInstance)
	
func createRightLeaf(leafX, leafY):
	var rightLeafInstance = RightLeaf.instance()
	var scale = Vector2(4, 4)
	rightLeafInstance.set_scale(scale)
	rightLeafInstance.set_name("rightLeaf")
	rightLeafInstance.global_position.x = leafX
	rightLeafInstance.global_position.y = leafY
	add_child(rightLeafInstance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	
#func _process(delta):
#	var windowSize = get_viewport_rect().size
##	print(windowSize)
#	var windowX = windowSize.x
#	var windowY = windowSize.y
#	var oneX = windowX / 32
#	var oneY = windowY
#
#	createBeanstalk(oneX, 0)
