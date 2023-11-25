extends Node2D

class_name TurnQueue

var current_character
var color_rect

func _ready():
	initialize()

func initialize():
	current_character = get_child(0)
	current_character.color = Color.WHITE	

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_SPACE:
			play_turn()

func play_turn():
	current_character.get_child(0)
	current_character.color = Color.RED	
	var new_index : int = (current_character.get_index() + 1) % get_child_count()
	current_character = get_child(new_index)
	current_character.color = Color.WHITE
