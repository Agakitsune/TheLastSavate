extends Node2D

@export var start_tile: Array[Vector2]
@export var enemy_tile: Array[Vector2]
@export var enemy: Array[PackedScene]
@export var boss: PackedScene

@export var attack_tile: Array[Vector2]

@export var player: PackedScene

@export var stage: TileMap
@export var select_stage: TileMap

@onready var _player = player.instantiate()
@onready var _boss = boss.instantiate()

var _enemies: Array[Node]
var _turn: Array[Node]

enum Phase {
	SELECTION_PHASE,
	ORIENTATION_PHASE,
	MOVE_PHASE,
	ATTACK_PHASE,
	ORIENTATION2_PHASE
}

var _phase: Phase

var _up_over = false
var _left_over = false
var _down_over = false
var _right_over = false

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(_player)
	_player.orientate("up")
	_player.hide()
	_player.stage = stage
	_player.notifier = self
	$Button.hide()
	$Button2.hide()
	$Button3.hide()
	
	$TileMap.add_child(_boss)

	$Up.hide()
	$Left.hide()
	$Right.hide()
	$Down.hide()

	for pos in start_tile:
		select_stage.set_cell(0, pos, 0, Vector2(0, 0))
	select_stage.replace()
	
	var t = preload("res://scenes/enemy/Turn.tscn")	
	for i in range(0, len(enemy_tile)):
		var e = enemy[i].instantiate()
		e.global_position = stage.map_to_local(enemy_tile[i])
		e.orientate("down")
		add_child(e)
		_enemies.append(e)
		
		e.notifier = self
		
		var t_i = t.instantiate()
		t_i.texture = load("res://assets/cultist/cultist_front_0001.png")
		$Camera2D/CanvasLayer.add_child(t_i)
		t_i.set_life(e.life)
		t_i._ready()
		t_i.global_position.y += len(_turn) * 70
		_turn.append(t_i)
	
	var t_i = t.instantiate()
	t_i.texture = load("res://assets/super_payet/SuperPayet_0001.png")
	$Camera2D/CanvasLayer.add_child(t_i)
	t_i.set_life(_player.life)
	t_i._ready()
	t_i.global_position.y += len(_turn) * 70
	_turn.append(t_i)
	
	pass # Replace with function body.

func notify(event: String, data):
	print("Notify: " + event)
	if event == "PlayerMove":
		_setup_phase(Phase.ATTACK_PHASE)
	elif event == "Damage":
		data.damage(5)
		var i = _enemies.find(data)
		_turn[i].set_life(data.life)
		_turn[i]._ready()
	elif event == "PlayerDead":
		pass
	elif event == "EnemyDead":
		remove_child(data)
		var i = _enemies.find(data)
		$Camera2D/CanvasLayer.remove_child(_turn[i])

func _enter_start_tile(pos: Vector2):
	if _phase == Phase.SELECTION_PHASE:
		_player.global_position = pos

		_player.show()
		$Button.show()
	elif _phase == Phase.MOVE_PHASE:
#		print(pos)
#		_player.global_position = pos
		_player.moveTo(pos)

		select_stage.hide()
	elif _phase == Phase.ATTACK_PHASE:
		var e = null
		for en in _enemies:
			if en.global_position == pos:
				e = en
		_player.attackTo(pos, e)
		select_stage.hide()
		_setup_phase(Phase.ORIENTATION2_PHASE)
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_button_pressed():
	_setup_phase(Phase.ORIENTATION_PHASE)
	pass # Replace with function body.
	
func _on_button_2_pressed():
	_setup_phase(Phase.MOVE_PHASE)
	pass # Replace with function body.	
	
func _on_button_3_pressed():
	_setup_phase(Phase.ORIENTATION2_PHASE)
	pass # Replace with function body.	

func _setup_phase(phase: Phase):
	_phase = phase
	if phase == Phase.ORIENTATION_PHASE or phase == Phase.ORIENTATION2_PHASE:
		$Button.hide()
		$Button3.hide()
		select_stage.hide()

		$Button2.show()
		$Up.show()
		$Left.show()
		$Right.show()
		$Down.show()

		$Up.global_position = _player.global_position + Vector2(20, -20)
		$Left.global_position = _player.global_position + Vector2(-20, -20)
		$Right.global_position = _player.global_position + Vector2(20, 0)
		$Down.global_position = _player.global_position + Vector2(-20, 0)
	elif phase == Phase.MOVE_PHASE:
		$Button2.hide()
		$Up.hide()
		$Left.hide()
		$Right.hide()
		$Down.hide()
		
		for i in range(0, select_stage.get_child_count()):
			select_stage.remove_child(select_stage.get_child(0))
		select_stage.show()
		
		_generate_moves()
	elif phase == Phase.ATTACK_PHASE:
		$Button3.show()
		for i in range(0, select_stage.get_child_count()):
			select_stage.remove_child(select_stage.get_child(0))
		select_stage.show()
		
		_generate_attack()

func distance(tile: Vector2, other: Vector2):
	return abs(tile.x - other.x) + abs(tile.y - other.y)

func _generate_attack():
	var cells = stage.get_used_cells(0)
	var out_cells = stage.get_used_cells(1)
	
	var tile_pos = stage.local_to_map(_player.global_position)
	var tiles = []
	var attack = []
	for cell in cells:
		if cell != tile_pos:
			if distance(cell, tile_pos) == 2:
				tiles.append(cell)
	
	for cell in out_cells:
		if cell != tile_pos:
			var d = distance(cell, tile_pos)
			if d == 2:
				tiles.append(cell)

	for e in _enemies:
		tile_pos = stage.local_to_map(e.global_position)
		if tile_pos in tiles:
			attack.append(tile_pos)
	tiles.clear()

	for c in tiles:
		select_stage.set_cell(0, c, 0, Vector2(0,0))
	
	for c in attack:
		select_stage.set_cell(0, c, 1, Vector2(0,0))
	
	select_stage.replace()

func _generate_moves():
	var cells = stage.get_used_cells(0)
	var out_cells = stage.get_used_cells(1)
	
	var tile_pos = stage.local_to_map(_player.global_position)
	var tiles = []
	for cell in cells:
		if cell != tile_pos:
			if distance(cell, tile_pos) <= 3:
				tiles.append(cell)
	
	for cell in out_cells:
		if cell != tile_pos:
			if distance(cell, tile_pos) <= 3:
				tiles.append(cell)

	for e in _enemies:
		tile_pos = stage.local_to_map(e.global_position)
		tiles.erase(tile_pos)

	for c in tiles:
		select_stage.set_cell(0, c, 0, Vector2(0,0))
	select_stage.replace()

func _input(event):
	if _phase == Phase.ORIENTATION_PHASE:
		if event as InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			if _up_over:
				_player.orientate("up")
			elif _left_over:
				_player.orientate("left")
			elif _down_over:
				_player.orientate("down")
			elif _right_over:
				_player.orientate("right")

func _orientation_up_in():
	_up_over = true
	pass
	
func _orientation_up_out():
	_up_over = false
	pass
	
func _orientation_left_in():
	_left_over = true
	pass
	
func _orientation_left_out():
	_left_over = false
	pass
	
func _orientation_down_in():
	_down_over = true
	pass
	
func _orientation_down_out():
	_down_over = false
	pass
		
func _orientation_right_in():
	_right_over = true
	pass
	
func _orientation_right_out():
	_right_over = false
	pass
