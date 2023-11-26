extends AnimatedSprite2D

@export var stage: TileMap
@export var savate: PackedScene
@export var notifier: Node

var walk: bool
var dest: Vector2
var start: Vector2
var actual: Vector2
var life: int

# Called when the node enters the scene tree for the first time.
func _ready():
	life = 100
	walk = false
	pass # Replace with function body.

func die():
	var anim = animation.split("_")
	if len(anim) > 1:
		anim = anim[1]
	play("death_" + anim)
	notifier.notify("PlayerDead")

func damage(value):
	life -= value
	if (life <= 0):
		die()

func stand():
	var anim = animation.split("_")
	if len(anim) > 1:
		play(anim[1])
	pass

func _on_animation_finished():
	var anim = animation.split("_")
	if len(anim) > 1:
		play(anim[1])
	pass # Replace with function body.

func attack(victim: Node):
	if animation == "up":
		play("attack_up")
	else:
		play("attack_down")
	var obj = savate.instantiate()
	obj.global_position = global_position
	obj.victim = victim
	obj.notifier = notifier
	add_child(obj)
	pass

func orientate(orientation: String):
	if orientation == "up":
		if walk:
			if animation != "walk_up":
				play("walk_up")
		else:
			play("up")
		flip_h = true
	elif orientation == "left":
		if walk:
			if animation != "walk_up":
				play("walk_up")
		else:
			play("up")
		flip_h = false
	elif orientation == "down":
		if walk:
			if animation != "walk_down":
				play("walk_down")
		else:
			play("down")
		flip_h = false
	elif orientation == "right":
		if walk:
			if animation != "walk_down":
				play("walk_down")
		else:
			play("down")
		flip_h = true
	pass

func moveTo(to: Vector2):
	walk = true
	dest = to
#	dest = to_global(dest)
	start = global_position
	actual = start
	print(to)
	print(dest)
	print(start)

func attackTo(to: Vector2, victim: Node):
	var dx = to.x - global_position.x
	var dy = to.y - global_position.y

	if (dx < 0):
		orientate("left")
	elif (dx > 0):
		orientate("right")
	elif (dy < 0):
		orientate("up")
	elif (dy > 0):
		orientate("down")
	attack(victim)

func _move(delta):
	var dx = dest.x - actual.x
	var dy = dest.y - actual.y

	if (dx >= -1 and dx <= 1 and dy >= -1 and dy <= 1):
		walk = false
		global_position = dest
		stand()
		notifier.notify("PlayerMove", null)
		pass

#	print(dx)
#	print(dy)
#	print(animation)

	if (dx < 0):
		actual.x -= delta * 100
		orientate("left")
	elif (dx > 0):
		actual.x += delta * 100
		orientate("right")
	if (dy < 0):
		actual.y -= delta * 50
		orientate("up")
	elif (dy > 0):
		actual.y += delta * 50
		orientate("down")

	global_position = actual
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Move to destination
	if walk:
		_move(delta)
	pass
