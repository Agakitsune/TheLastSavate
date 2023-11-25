extends Node2D

class_name TurnQueue

var activeEntity

func initialize():
	activeEntity = get_child(0)
	
func playTurn():
#	yield(activeEntity.playTurn(), "completed")
	var newIndex : int = (activeEntity.get_index() + 1) % get_child_count()
	activeEntity = get_child(newIndex)
	
