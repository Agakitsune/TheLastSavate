extends ColorRect

var sprite: Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = $Sprite2D
	pass # Replace with function body.

func setTexture(new_texture: Texture):
	sprite.texture = new_texture

func getSprite():
	return sprite

# Called every frame. 'delta' is the elapsed time since the previous frame.
