extends ColorRect

@export var texture: Texture
@export var vie: int

var sprite: Sprite2D
var visu: Node
# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = $Sprite2D
	var element = preload("res://assets/TurnQueue/element.tscn")
	if element:
		var obj = element.instantiate()
		obj._ready()
		
		var s = obj.getSprite()
		s.texture = texture
		var control = obj.get_child(2)
		control._ready()
		visu = control.get_child(0)
		visu.value.assign([sprite.vie, sprite.attack])
		add_child(obj)
	pass # Replace with function body.

func set_life(life):
	sprite.vie = life
	visu.value.assign([sprite.vie, sprite.attack])

func setObject(object):
	if object:
		var obj = object.instantiate()

		obj.setTexture(texture)
		add_child(obj)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
