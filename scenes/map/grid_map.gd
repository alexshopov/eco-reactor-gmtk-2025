class_name Map
extends GridMap


var tiles : Dictionary

func _ready() -> void:
    var cells := get_used_cells()
    for cell in cells:
        var tile := get_cell_item(cell)

        var tile_data = MapTile.new()
        tile_data.tile_type = tile as Enums.TileType
        tiles.set(cell, tile_data)


    EventBus.active_tile_changed.connect(_on_active_tile_changed)


func _on_active_tile_changed(active_tile: Vector3) -> void:
    active_tile.y = -1
    if active_tile:
        EventBus.tile_highlighted.emit(tiles.get(local_to_map(active_tile)))