extends Area2D

@export var owner_node: Node
@export var attack: bool

var _mouse_over: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	if attack:
		$Sprite2D.texture = load("res://assets/textures/tiles/player_attack.png")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if _mouse_over and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		owner_node._enter_start_tile(self.global_position)

func _on_mouse_entered():
	_mouse_over = true
	pass # Replace with function body.

func _on_mouse_exited():
	_mouse_over = false
	pass # Replace with function body.
