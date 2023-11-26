extends Node2D

@onready var label = get_node("Label")
@onready var tween = create_tween()
var damage = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	label.set_text(str(damage))
	tween.tween_property(label, "scale", Vector2(2,2), 0.5).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
	tween.tween_property(label, "scale", Vector2(0,0), 0.3).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
