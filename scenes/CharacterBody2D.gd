extends CharacterBody2D

func _ready():
	global_position = Vector2($"../TileMap".baseTile)

func _physics_process(_delta):
	MoveMouse()
	move_and_slide()

func MoveMouse():
	if Input.is_action_just_pressed("LeftClick"):
		global_position = Vector2($"../TileMap".selectedTile)
