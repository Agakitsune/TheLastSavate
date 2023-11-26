extends Sprite2D

@export var map: TileMap
@export var select_map: TileMap

var possible_moves: Array[Vector2]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func distance(tile: Vector2, other: Vector2):
	return abs(tile.x - other.x) + abs(tile.y - other.y)

func generate_moves():
	var cells = map.get_used_cells(0)
	var out_cells = map.get_used_cells(1)
	
	var tile_pos = map.local_to_map(global_position)
	var tiles = []
	for cell in cells:
		if cell != tile_pos:
			if distance(cell, tile_pos) <= 3:
				tiles.append(cell)
	
	for cell in out_cells:
		if cell != tile_pos:
			if distance(cell, tile_pos) <= 3:
				tiles.append(cell)

	for c in tiles:
		select_map.set_cell(0, c, 0, Vector2(0,0))
	select_map.replace()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	checkClick()
	pass

func checkClick():
	pass
