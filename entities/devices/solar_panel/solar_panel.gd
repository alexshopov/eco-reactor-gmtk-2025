class_name SolarPanel
extends Device


func can_build(tile_type: Enums.TileType) -> bool:
    return tile_type == Enums.TileType.Ground