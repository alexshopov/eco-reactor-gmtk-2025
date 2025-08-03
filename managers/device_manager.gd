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
@export
var biomass_generator_scene : PackedScene
@export
var nutrient_vat_scene : PackedScene
@export
var fungal_decomposer_scene: PackedScene
@export
var aeroponic_tower_scene: PackedScene

var dialog_theme : Theme = load("res://resources/confirmation_dialog.tres")
var active_tile : Dictionary = {
	"pos": Vector3.INF,
	"data": null
} 
var device_scenes : Dictionary = {}
var active_devices : Dictionary = {}
var temp_cost : int
var temp_device : Device

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
		},
		Enums.DeviceType.BiomassGenerator: {
			"scene": biomass_generator_scene
		},
		Enums.DeviceType.NutrientVat: {
			"scene": nutrient_vat_scene
		},
		Enums.DeviceType.FungalDecomposer: {
			"scene": fungal_decomposer_scene
		},
		Enums.DeviceType.AeroponicTower: {
			"scene": aeroponic_tower_scene
		},
	}

	EventBus.tick_completed.connect(_on_tick)
	EventBus.device_card_clicked.connect(_on_device_card_clicked)
	EventBus.device_card_cancelled.connect(_on_device_card_cancelled)
	EventBus.tile_highlighted.connect(_on_tile_highlighted)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		set_device()

	if event.is_action_pressed("destroy_device"):
		if not active_tile.data:
			return

		if active_tile.data.device_type != Enums.DeviceType.Null:
			open_confirmation_dialog()


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
	active_tile["pos"] = tile_pos
	active_tile["data"] = tile_data
	if active_tile["pos"] == Vector3.INF:
		return

	if not active_tile["data"]:
		return

	active_tile["pos"].y = 0
	if temp_device and temp_device.can_build(active_tile["data"]):
		temp_device.global_position = active_tile["pos"]


func set_device() -> void:
	if temp_device and ResourcesManager.energy > temp_cost:
		ResourcesManager.energy -= temp_cost
		var device = temp_device.duplicate()
		temp_device.queue_free()

		active_tile["data"].device_type = device.device_type
		active_devices.set(active_tile["pos"], device)
		add_child(device)

		sound_player.play()

		EventBus.device_placed.emit(active_tile["pos"], active_tile["data"])


func open_confirmation_dialog() -> void:
	var dialog := ConfirmationDialog.new()
	dialog.theme = dialog_theme
	dialog.dialog_text = "Destroy %s?" % Constants.DEVICES[active_tile.data.tile_type].name

	dialog.confirmed.connect(delete_device)

	add_child(dialog)
	dialog.popup_centered()
	dialog.show()


func delete_device() -> void:
	active_devices.get(active_tile.pos).queue_free()
	active_devices.erase(active_tile.pos)
	EventBus.device_destroyed.emit(active_tile.pos)
