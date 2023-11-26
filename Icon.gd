extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos = get("position")
	var vel = Vector2(0, 0)
	if Input.is_action_pressed("up"):
		vel.y = -1
	if Input.is_action_pressed("down"):
		vel.y = 1
	if Input.is_action_pressed("right"):
		vel.x = 1
	if Input.is_action_pressed("left"):
		vel.x = -1
	set("position", pos + vel)
	pass
