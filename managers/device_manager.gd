class_name DeviceManager
extends Node

@export_group("Devices")
@export
var algae_tank_scene : PackedScene
@export
var compost_reactor_scene : PackedScene


var devices : Dictionary = {}


func _ready() -> void:
	var algae_tank := algae_tank_scene.instantiate()
	devices.set(Vector3(-1, 0, -1), algae_tank)
	add_child(algae_tank)
	algae_tank.global_position = Vector3(-1, 0, -1)

	var compost_reactor := compost_reactor_scene.instantiate()
	devices.set(Vector3(3, 0, -1), compost_reactor)
	add_child(compost_reactor)
	compost_reactor.global_position = Vector3(3, 0, -1)

	EventBus.active_tile_changed.connect(_on_active_tile_changed)


func update_devices() -> void:
	for device in devices:
		print(device)


func _on_active_tile_changed(tile_pos: Vector3) -> void:
	tile_pos.y = 0
	var device := devices.get(tile_pos) as Device
	EventBus.device_highlighted.emit(device)
