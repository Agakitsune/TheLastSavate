extends Node2D

@export var bullet: PackedScene
@export var sprite: AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.show()
	sprite.play("down")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	var anim = sprite.animation
	var flip = sprite.flip_h
	var walk = anim.begins_with("walk")
	if walk:
		anim = anim.split("_")[1]
	if (anim == "down"):
		if (flip):
			sprite.flip_h = false
		else:
			if walk:
				sprite.play("walk_up")
			else:
				sprite.play("up")
	elif (anim == "up"):
		if (flip):
			if walk:
				sprite.play("walk_down")
			else:
				sprite.play("down")
		else:
			sprite.flip_h = true
	pass # Replace with function body.


func _on_button_2_pressed():
	var anim = sprite.animation
	var flip = sprite.flip_h
	var walk = anim.begins_with("walk")
	if walk:
		anim = anim.split("_")[1]
	if (anim == "down"):
		if (flip):
			if walk:
				sprite.play("walk_up")
			else:
				sprite.play("up")
		else:
			sprite.flip_h = true
	elif (anim == "up"):
		if (flip):
			sprite.flip_h = false
		else:
			if walk:
				sprite.play("walk_down")
			else:
				sprite.play("down")
	pass # Replace with function body.


func _on_button_3_pressed():
	var anim = sprite.animation
	if anim == "walk_up":
		sprite.play("up")
	elif anim == "walk_down":
		sprite.play("down")
	elif anim == "up":
		sprite.play("walk_up")
	else:
		sprite.play("walk_down")
	pass # Replace with function body.


func _on_button_4_pressed():
	var anim = sprite.animation
	var flip = sprite.flip_h
	var walk = anim.begins_with("walk")
	if walk:
		anim = anim.split("_")[1]
	var obj = bullet.instantiate()
	if anim == "down":
		sprite.play("attack_down")
		if flip:
			obj.set("metadata/velocity", Vector2(100, 50))
		else:
			obj.set("metadata/velocity", Vector2(-100, 50))
	else:
		if flip:
			obj.set("metadata/velocity", Vector2(100, -50))
		else:
			obj.set("metadata/velocity", Vector2(-100, -50))
		sprite.play("attack_up")
	obj.set("position", sprite.position)
	obj.set("metadata/life", 2)
	add_child(obj)
	pass # Replace with function body.


func _on_animated_sprite_2d_animation_finished():
	var anim = sprite.animation
	if anim == "attack_down":
		sprite.play("down")
	else:
		sprite.play("up")
	pass # Replace with function body.
