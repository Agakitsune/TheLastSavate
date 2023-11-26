extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

func _process(_delta):
	_animated_sprite.play("rotate")
	moveTo(Vector2(2,3))

func moveTo(pos):
	_animated_sprite.position = pos
