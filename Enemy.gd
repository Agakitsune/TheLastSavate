extends Sprite2D

const MAX_HEALTH = 15
var hp = MAX_HEALTH
var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	setHpBar()

func setHpBar():
	$HealthBar.max_value = MAX_HEALTH
	$HealthBar.value = hp

func damage():
	hp -= 1
	if hp < 0:
		hp = MAX_HEALTH
	setHpBar()

func _input(event : InputEvent):
	if event.is_action_pressed("ui_accept"):
		damage()
	if event.is_action("ui_right"):
		position.x += speed * get_process_delta_time()
	if event.is_action("ui_left"):
		position.x -= speed * get_process_delta_time()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
