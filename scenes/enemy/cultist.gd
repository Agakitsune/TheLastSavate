extends AnimatedSprite2D

var walk: bool
var life: int

# Called when the node enters the scene tree for the first time.
func _ready():
	life = 10
	walk = false
	setHpBar()
	pass # Replace with function body.

func damage(value):
	life -= value
	$HealthBar.value = life
	if life <= 0:
		pass

func setHpBar():
	$HealthBar.max_value = life
	$HealthBar.value = life

func orientate(orientation: String):
	if orientation == "up":
		if walk:
			play("walk_up")
		else:
			play("up")
		flip_h = true
	elif orientation == "left":
		if walk:
			play("walk_up")
		else:
			play("up")
		flip_h = false
	elif orientation == "down":
		if walk:
			play("walk_down")
		else:
			play("down")
		flip_h = false
	elif orientation == "right":
		if walk:
			play("walk_down")
		else:
			play("down")
		flip_h = true
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
