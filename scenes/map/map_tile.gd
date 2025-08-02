class_name MapTile
extends RefCounted

var tile_type : Enums.TileType
var device_type : Enums.DeviceType
var description : String

func _init() -> void:
	tile_type = Enums.TileType.Ground
	device_type = Enums.DeviceType.Null
