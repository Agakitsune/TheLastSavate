extends AspectRatioContainer

@export var title: String
@export var stats: Array[String]
@export var value: Array[int]
@export var backColor: Color

var _value: Array[int]
# Called when the node enters the scene tree for the first time.
func _ready():
	_load()
	pass # Replace with function body.

func _load():
	$M/Back.color = backColor
	$M/M1/V/M2/Title.text = title

	for i in range(0, len(stats)):
		var line = HBoxContainer.new()
		
		var stat = Label.new()
		stat.text = str(stats[i]) + " :"
		stat.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
		stat.vertical_alignment = VERTICAL_ALIGNMENT_FILL
		stat.set("theme_override_font_sizes/font_size", 14)
		
		var val = Label.new()
		if (_value.is_empty()):
			val.text = str(value[i])
		else:
			val.text = str(_value[i])
		val.set("theme_override_font_sizes/font_size", 14)
		
		line.add_child(stat)
		line.add_child(val)
		$M/M1/V.add_child(line)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
