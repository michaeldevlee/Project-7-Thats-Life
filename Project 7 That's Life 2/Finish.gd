extends Node2D



var LeftLeaf = load("res://LeftLeaf.tscn")
var RightLeaf = load("res://RightLeaf.tscn")
var Cloud = load("res://Cloud.tscn")
var items = [LeftLeaf, RightLeaf, Cloud]
var instances = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func createRandomItem():
	if(instances.size() > 24):
		for n in range(0, 25, 1):
			instances.pop_back().queue_free()
		
	var windowSize = get_viewport_rect().size
	var windowX = windowSize.x
	var windowY = windowSize.y
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var leafX = int(round(rng.randf_range(0, windowX)))
	var leafY = int(round(rng.randf_range(0, windowY)))
	
	var instance = items[int(rng.randf_range(0, 3))].instance()
	var scale = Vector2(1, 1)
	instance.set_scale(scale)
	instance.set_name("leftLeaf")
	instance.global_position.x = leafX
	instance.global_position.y = leafY
	instances.append(instance)
	add_child(instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_key_pressed(KEY_ENTER)):
		get_tree().change_scene("res://Title Screen.tscn")
	createRandomItem()
