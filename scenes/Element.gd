extends ColorRect

@export var texture: Texture

# Called when the node enters the scene tree for the first time.
func _ready():
	var element = preload("res://assets/TurnQueue/element.tscn")
	if element:
		var obj = element.instantiate()
		obj._ready()
		
		var sprite = obj.getSprite()
		sprite.texture = texture
		add_child(obj)
	pass # Replace with function body.

func setObject(object):
	if object:
		var obj = object.instantiate()

		obj.setTexture(texture)
		add_child(obj)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
