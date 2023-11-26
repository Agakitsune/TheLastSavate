extends TileMap

func _ready():
	var fire_tile = preload("res://scenes/special_tile/Fire.tscn")
	replace_tiles(fire_tile)

func replace_tiles(tile):
	for tile_pos in get_used_cells(0):
		var tile_id = get_cell_source_id(0, tile_pos)
		
		#if scene_dictionary.has(tile_id):
			#var object_scene = scene_dictionary[tile_id]
		replace_tile_with_object(tile_pos, tile)

func replace_tile_with_object(tile_pos, object):
	if tile_pos:
		set_cell(0, tile_pos)
	
	if object:
		var obj = object.instantiate()
		var obj_pos = map_to_local(tile_pos)
		
		add_child(obj)
		obj.global_position = to_global(obj_pos)
