extends AspectRatioContainer

@export var title: String
@export var value: Array[int]
@export var effect: Array[String]
@export var effectColor: Array[Color]
@export var backColor: Color

# Called when the node enters the scene tree for the first time.
func _ready():
	$M/M1/V/M2/Title.text = title
	$M/Back.color = backColor
	for i in range(0, len(effect)):
		var line = HBoxContainer.new()
		
		var a = Label.new()
		a.text = "Apply"
		a.set("theme_override_font_sizes/font_size", 14)
		
		var val = Label.new()
		val.text = str(value[i])
		val.set("theme_override_font_sizes/font_size", 14)
		
		var eff = Label.new()
		eff.text = effect[i]
		if effectColor[i]:
			eff.set("theme_override_colors/font_color", effectColor[i])
		eff.set("theme_override_font_sizes/font_size", 14)
		
		var e = Label.new()
		e.text = "effect"
		e.set("theme_override_font_sizes/font_size", 14)
		
		line.add_child(a)
		line.add_child(val)
		line.add_child(eff)
		line.add_child(e)
		$M/M1/V.add_child(line)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
