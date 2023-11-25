extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("zoom_in") and zoom.x < 4:
		zoom = get("zoom") + Vector2(0.5, 0.5)
	if Input.is_action_just_released("zoom_out") and zoom.x > 1:
		zoom = get("zoom") - Vector2(0.5, 0.5)
	pass
