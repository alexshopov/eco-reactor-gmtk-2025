class_name DeviceManager
extends Node

@export_group("Devices")
@export
var algae_tank_scene : PackedScene
@export
var compost_reactor_scene : PackedScene
@export
var water_purifier_scene : PackedScene
@export
var solar_panel_scene : PackedScene

var active_tile : Vector3
var device_scenes : Dictionary = {}
var temp_cost : int
var temp_device : Device
var active_devices : Dictionary = {}

@onready
var sound_player : AudioStreamPlayer = $DeviceSoundPlayer

func _ready() -> void:
	device_scenes = {
		Enums.DeviceType.AlgaeTank: {
			"scene": algae_tank_scene
		},
		Enums.DeviceType.CompostReactor: {
			"scene": compost_reactor_scene
		},
		Enums.DeviceType.WaterPurifier: {
			"scene": water_purifier_scene
		},
		Enums.DeviceType.SolarPanel: {
			"scene": solar_panel_scene
		}
	}

	EventBus.tick_completed.connect(_on_tick)
	EventBus.device_card_clicked.connect(_on_device_card_clicked)
	EventBus.device_card_cancelled.connect(_on_device_card_cancelled)
	EventBus.tile_highlighted.connect(_on_tile_highlighted)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		if temp_device and ResourcesManager.energy > temp_cost:
			ResourcesManager.energy -= temp_cost
			var device = temp_device.duplicate()
			temp_device.queue_free()

			active_devices.set(active_tile, device)
			add_child(device)
			sound_player.play()


func _on_tick(_turn: int) -> void:
	for idx in active_devices:
		active_devices[idx].process_turn()


func _on_device_card_cancelled() -> void:
	if temp_device:
		temp_device.queue_free()


func _on_device_card_clicked(device_type: Enums.DeviceType) -> void:
	temp_cost = Constants.DEVICES[device_type].cost
	temp_device = device_scenes[device_type].scene.instantiate() as Device
	add_child(temp_device)
	temp_device.global_position = Vector3(1, 0, 1)


func _on_tile_highlighted(tile_pos: Vector3, tile_data: MapTile) -> void:
	active_tile = tile_pos
	if active_tile == Vector3.INF:
		return

	if not tile_data:
		return

	active_tile.y = 0
	if temp_device and temp_device.can_build(tile_data.tile_type):
		temp_device.global_position = active_tile

	var device := active_devices.get(active_tile) as Device
	EventBus.device_highlighted.emit(device)
