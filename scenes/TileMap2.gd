extends TileMap

var selectedTile
var baseTile

func _ready():
	baseTile = map_to_local(Vector2(-1,0))
	
func _process(_delta):
	var tile = local_to_map(get_global_mouse_position())
	selectedTile = map_to_local(tile)
	set_cell(0, Vector2(15,15), 0, Vector2(7,3), 0)
