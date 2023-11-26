extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var vel = get("metadata/velocity")
	print(vel)
	var life = get("metadata/life")
	print(life)	
	if (life <= 0):
		get_parent().remove_child(self)
	print(vel * delta)
	position += vel * delta
	set("metadata/life", life - delta)	
	pass
