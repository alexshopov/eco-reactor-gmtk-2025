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

		if tile_data.tile_type == Enums.TileType.Water:
			$Terrain.spawn_water()
		elif tile_data.tile_type == Enums.TileType.Ground:
			var rand = randf()
			if rand < forest_spawn_chance:
				tile_data.tile_type = Enums.TileType.Forest
				$Terrain.spawn_forest(map_to_local(cell))

		tiles.set(cell, tile_data)


	EventBus.active_tile_changed.connect(_on_active_tile_changed)


func _on_active_tile_changed(active_tile: Vector3) -> void:
	active_tile.y = -1
	if active_tile:
		var cell := local_to_map(active_tile)
		EventBus.tile_highlighted.emit(active_tile, tiles.get(cell))