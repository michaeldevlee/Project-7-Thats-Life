extends Node2D

var Beanstalk = load("res://Beanstalk.tscn")





# Called when the node enters the scene tree for the first time.
func _ready():
	var windowSize = get_viewport_rect().size
	print(windowSize)

	var windowX = windowSize.x

	var oneX = windowX / 2
	var threeX = windowX / 16
	var twoX = windowX / 32

	for n in range(-5400, 5400, 540):
		createBeanstalk(oneX, n)
		createBeanstalk(twoX, n)
		createBeanstalk(threeX, n)



	
#func _process(delta):
#	var windowSize = get_viewport_rect().size
##	print(windowSize)
#	var windowX = windowSize.x
#	var windowY = windowSize.y
#	var oneX = windowX / 32
#	var oneY = windowY
#
#	createBeanstalk(oneX, 0)

func createBeanstalk(posX, posY):
	var beanstalkInstance = Beanstalk.instance()
	var scale = Vector2(3, 3)
	beanstalkInstance.set_scale(scale)
	beanstalkInstance.set_name("beanstalk")
	beanstalkInstance.global_position.x = posX
	beanstalkInstance.global_position.y = posY
	add_child(beanstalkInstance)
	
#	if beanstalkInstance.position.y <= get_viewport_rect().size.y:
#		createBeanstalk(posX, posY + 540)










func _exit_tree():
	Global.world = null






# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func createBeanstalk():
#	var beanstalk = Beanstalk.instance()
#	while beanstalk.position.y < OS.get_windows_size():
