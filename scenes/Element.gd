extends ColorRect

@export var texture: Texture

var _sprite: Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	_sprite = $Sprite2D
	var element = preload("res://assets/TurnQueue/element.tscn")
	if element:
		var obj = element.instantiate()
		obj._ready()
		
		var sprite = obj.getSprite()
		sprite.texture = texture
		var control = obj.get_child(2)
		control._ready()
		var visual = control.get_child(0)
		visual.value.assign([_sprite.vie, _sprite.attack])
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
