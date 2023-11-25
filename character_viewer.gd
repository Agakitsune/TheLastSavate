extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("down")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	var anim = $AnimatedSprite2D.animation
	var flip = $AnimatedSprite2D.flip_h
	var walk = anim.begins_with("walk")
	if walk:
		anim = anim.split("_")[1]
	if (anim == "down"):
		if (flip):
			$AnimatedSprite2D.flip_h = false
		else:
			if walk:
				$AnimatedSprite2D.play("walk_up")
			else:
				$AnimatedSprite2D.play("up")
	elif (anim == "up"):
		if (flip):
			if walk:
				$AnimatedSprite2D.play("walk_down")
			else:
				$AnimatedSprite2D.play("down")
		else:
			$AnimatedSprite2D.flip_h = true
	pass # Replace with function body.


func _on_button_2_pressed():
	var anim = $AnimatedSprite2D.animation
	var flip = $AnimatedSprite2D.flip_h
	var walk = anim.begins_with("walk")
	if walk:
		anim = anim.split("_")[1]
	if (anim == "down"):
		if (flip):
			if walk:
				$AnimatedSprite2D.play("walk_up")
			else:
				$AnimatedSprite2D.play("up")
		else:
			$AnimatedSprite2D.flip_h = true
	elif (anim == "up"):
		if (flip):
			$AnimatedSprite2D.flip_h = false
		else:
			if walk:
				$AnimatedSprite2D.play("walk_down")
			else:
				$AnimatedSprite2D.play("down")
	pass # Replace with function body.


func _on_button_3_pressed():
	var anim = $AnimatedSprite2D.animation
	if anim == "walk_up":
		$AnimatedSprite2D.play("up")
	elif anim == "walk_down":
		$AnimatedSprite2D.play("down")
	elif anim == "up":
		$AnimatedSprite2D.play("walk_up")
	else:
		$AnimatedSprite2D.play("walk_down")
	pass # Replace with function body.
