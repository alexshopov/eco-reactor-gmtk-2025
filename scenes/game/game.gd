extends Node3D


var active_tile : Vector3 :
	set(value):
		if active_tile == value:
			return

		active_tile = value
		EventBus.active_tile_changed.emit(active_tile)


@onready
var game_manager : GameManager = $GameManager
@onready
var resources_manager : ResourcesManager = $ResourcesManager
@onready
var device_manager : DeviceManager = $DeviceManager
@onready
var map : GridMap = $GridMap
@onready
var cursor : Node3D = $GridMap/Cursor
@onready
var camera : Camera3D = $CameraRig/Camera3D


func _ready() -> void:
	ResourcesManager.energy = Constants.ENERGY_INITIAL_VALUE
	ResourcesManager.o2 = Constants.O2_INITIAL_VALUE
	ResourcesManager.co2 = Constants.CO2_INITIAL_VALUE
	ResourcesManager.biomass = Constants.BIOMASS_INITIAL_VALUE
	ResourcesManager.water = Constants.WATER_INITIAL_VALUE

	cursor.visible = false


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		_highlight_tile()


func _get_mouse_xz() -> Vector3:
	var mouse_pos := get_viewport().get_mouse_position()
	var ray_start := camera.project_ray_origin(mouse_pos)
	var ray_dir := camera.project_ray_normal(mouse_pos)

	var t := -ray_start.y / ray_dir.y
	return ray_start + ray_dir * t
	

func _highlight_tile() -> void:
	var world_pos := _get_mouse_xz()
	world_pos.y = -.5
	var cell_index := map.local_to_map(world_pos)
	if (map.get_cell_item(cell_index) != GridMap.INVALID_CELL_ITEM):
		var grid_pos := map.map_to_local(cell_index)
		if active_tile != grid_pos:
			active_tile = grid_pos

		grid_pos.y = 0.1
		cursor.visible = true
		cursor.global_position = grid_pos
	else:
		active_tile = Vector3.INF
		cursor.visible = false
