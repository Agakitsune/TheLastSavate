extends AnimatedSprite2D

@export var to: Vector2
@export var victim: Node
@export var notifier: Node

var dest: Vector2
var actual: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	play("default")
	dest = victim.global_position - Vector2(0, 0)
	actual = global_position - Vector2(0, 0)
	pass # Replace with function body.

func moveTo(delta):
	var dx = dest.x - actual.x
	var dy = dest.y - actual.y

	if (dx >= -1 and dx <= 1 and dy >= -1 and dy <= 1):
		notifier.notify("Damage", victim)
		get_parent().remove_child(self)
		pass

#	print(dx)
#	print(dy)
#	print(animation)

	if (dx < 0):
		actual.x -= delta * 300
	elif (dx > 0):
		actual.x += delta * 300
	if (dy < 0):
		actual.y -= delta * 150
	elif (dy > 0):
		actual.y += delta * 150

	global_position = actual

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	moveTo(delta)
	pass
