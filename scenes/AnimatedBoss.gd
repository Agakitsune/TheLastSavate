extends AnimatedSprite2D

var life: int
var notifier: Node
var dead: bool
var f: int

# Called when the node enters the scene tree for the first time.
func _ready():
	f = 4
	play()
	life = 100
	setHpBar()
	dead = false
	pass # Replace with function body.

func die():
	play("dead")
	dead = true

func damage(value):
	life -= value
	$HealthBar.value = life
	if life <= 0:
		die()
		pass

func setHpBar():
	$HealthBar.max_value = life
	$HealthBar.value = life

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dead:
		f = -f
		global_position.x = f
		global_position.y += delta * 10
	pass

func _on_animation_finished():
	print("a")
	if dead:
		notifier.notify("BossDead", null)
	pass # Replace with function body.
