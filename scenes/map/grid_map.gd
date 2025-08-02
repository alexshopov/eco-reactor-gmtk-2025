class_name Map
extends GridMap

@export_range(0, 1, 0.05)
var forest_spawn_chance : float = 0.1

var tiles : Dictionary

func _ready() -> void:
	randomize()

	var cells := get_used_cells()
	for cell in cells:
		var tile := get_cell_item(cell)

		var tile_data = MapTile.new()
		tile_data.tile_type = tile as Enums.TileType
		tile_data.device_type = Enums.DeviceType.Null

		if tile_data.tile_type == Enums.TileType.Water:
			$Terrain.spawn_water()
		elif tile_data.tile_type == Enums.TileType.Ground:
			var rand = randf()
			if rand < forest_spawn_chance:
				tile_data.tile_type = Enums.TileType.Forest
				$Terrain.spawn_forest(map_to_local(cell))

		tiles.set(cell, tile_data)


	EventBus.active_tile_changed.connect(_on_active_tile_changed)
	EventBus.device_placed.connect(_on_device_placed)
	EventBus.device_destroyed.connect(_on_device_destroyed)


func _on_active_tile_changed(active_tile: Vector3) -> void:
	active_tile.y = -1
	if active_tile:
		var cell := local_to_map(active_tile)
		EventBus.tile_highlighted.emit(active_tile, tiles.get(cell))


func _on_device_placed(pos: Vector3, tile_data: MapTile) -> void:
	var cell := pos
	cell.y = -1
	tiles[local_to_map(cell)] = tile_data


func _on_device_destroyed(pos: Vector3) -> void:
	var cell := pos
	cell.y = -1
	tiles[local_to_map(cell)].device_type = Enums.DeviceType.Null
