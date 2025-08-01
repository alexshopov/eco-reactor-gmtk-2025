class_name MapTile
extends RefCounted

var tile_type : Enums.TileType
var terrain_type : Enums.TerrainType
var device_type : Enums.DeviceType

func _init() -> void:
	tile_type = Enums.TileType.Ground
	terrain_type = Enums.TerrainType.Null
	device_type = Enums.DeviceType.Null
