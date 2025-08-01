class_name DeviceManager
extends Node

@export_group("Devices")
@export
var algae_tank_scene : PackedScene
@export
var compost_reactor_scene : PackedScene

var active_tile : Vector3
var device_scenes : Dictionary = {}
var temp_device : Device
var active_devices : Dictionary = {}


func _ready() -> void:
	device_scenes = {
		Enums.DeviceType.AlgaeTank: algae_tank_scene,
		Enums.DeviceType.CompostReactor: compost_reactor_scene,
	}

	EventBus.device_card_clicked.connect(_on_device_card_clicked)
	EventBus.device_card_cancelled.connect(_on_device_card_cancelled)
	EventBus.active_tile_changed.connect(_on_active_tile_changed)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		if temp_device:
			var device = temp_device.duplicate()
			active_devices.set(active_tile, device)
			temp_device.queue_free()
			add_child(device)


func update_devices() -> void:
	for device in active_devices:
		print(device)


func _on_device_card_cancelled() -> void:
	if temp_device:
		temp_device.queue_free()


func _on_device_card_clicked(device_type: Enums.DeviceType) -> void:
	temp_device = device_scenes[device_type].instantiate() as Device
	add_child(temp_device)


func _on_active_tile_changed(tile_pos: Vector3) -> void:
	active_tile = tile_pos
	if active_tile == Vector3.INF:
		return

	tile_pos.y = 0
	if temp_device:
		temp_device.global_position = active_tile

	var device := active_devices.get(active_tile) as Device
	EventBus.device_highlighted.emit(device)

