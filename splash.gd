extends Node

const SOUND = preload("res://Quaso_Audio_Cut..mp3")

@onready var t = get_node("Timer")
@onready var splashSound = $splashSound

# Called when the node enters the scene tree for the first time.
func _ready():
	print("test")
	
	$AnimationPlayer.play("fadeToNormal")

func do_this():
	print("yo")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fadeToNormal":
		splashSound.play()
		$AnimationPlayer.play("fadeToBlack")
