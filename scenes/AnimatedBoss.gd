extends AnimatedSprite2D

var life: int

# Called when the node enters the scene tree for the first time.
func _ready():
	play()
	life = 100
	setHpBar()
	pass # Replace with function body.

func damage(value):
	life -= value
	$HealthBar.value = life
	if life <= 0:
#		die()
		pass

func setHpBar():
	$HealthBar.max_value = life
	$HealthBar.value = life

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
