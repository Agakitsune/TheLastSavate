class_name Tooltip
extends Control

@export var visuals_scene: PackedScene
@export var owner_path: NodePath

@export var title: String
@export var value: Array[int]
@export var effect: Array[String]
@export var effectColor: Array[Color]
@export var backColor: Color

@onready var _owner = get_node(owner_path)

var _visuals: Control
# Called when the node enters the scene tree for the first time.
func _ready():
	#print(visuals_scene)
	_visuals = visuals_scene.instantiate()
	
	_visuals.title = title
	_visuals.effect = effect
	_visuals.value = value
	_visuals.effectColor = effectColor
	if backColor:
		_visuals.backColor = backColor
	
	add_child(_visuals)
	_visuals.hide()
	_visuals.z_index = 100
	_owner.connect("mouse_entered", _mouse_enter)
	_owner.connect("mouse_exited", _mouse_exit)
	pass # Replace with function body.

func _mouse_enter():
	_visuals.show()
	
func _mouse_exit():
	_visuals.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_visuals.global_position = get_global_mouse_position() + Vector2(16,16)
	pass
