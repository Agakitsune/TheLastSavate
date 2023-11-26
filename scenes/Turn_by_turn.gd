extends Node2D

class_name TurnQueue

var current_character
var arrow
var arrow_pos

func _ready():
	initialize()

func _hide():
	for i in get_children():
		if (i.is_visible):
			var sprite = i.get_child(0)
			if (sprite.vie <= 0):
				i.hide()

func initialize():
	_hide()
	var index: int = 0
	current_character = get_child(index)
	while (!current_character.is_visible()):
		index = (current_character.get_index() + 1) % get_child_count()
		current_character = get_child(index)
	current_character.color.a = 1

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_SPACE:
			play_turn()

func play_turn():
	# await current_character.play_turn()
	current_character.color.a = 0
	var new_index : int = (current_character.get_index() + 1) % get_child_count()
	current_character = get_child(new_index)
	while (!current_character.is_visible()):
		new_index = (current_character.get_index() + 1) % get_child_count()
		current_character = get_child(new_index)
	current_character.color.a = 1

func  _process(_delta):
	_hide()
