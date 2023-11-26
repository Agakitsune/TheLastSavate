extends CanvasLayer

const MAX_HEALTH = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	$Health/fullHeart/ProgressHeart.value = MAX_HEALTH
	$Health/fullHeart/LabelHeart.text = "%s" % $Health/fullHeart/ProgressHeart.value

func updateText():
	$Health/fullHeart/LabelHeart.text = "%s" % $Health/fullHeart/ProgressHeart.value

func loseHP():
	$Health/fullHeart/ProgressHeart.value -= 5
	if $Health/fullHeart/ProgressHeart.value < 0:
		$Health/fullHeart/ProgressHeart.value = 0
	updateText()

func gainHP():
	$Health/fullHeart/ProgressHeart.value += 5
	if $Health/fullHeart/ProgressHeart.value > 100:
		$Health/fullHeart/ProgressHeart.value = 100
	updateText()
	
func setHP(nb):
	$Health/fullHeart/ProgressHeart.value = nb
	if $Health/fullHeart/ProgressHeart.value > 100:
		$Health/fullHeart/ProgressHeart.value = 100
	if $Health/fullHeart/ProgressHeart.value < 0:
		$Health/fullHeart/ProgressHeart.value = 0
	updateText()		

func _input(event : InputEvent):
	if event.is_action_pressed("ui_up"):
		gainHP()
	if event.is_action_pressed("ui_down"):
		loseHP()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
