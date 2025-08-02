class_name Terrain
extends Node

@export
var tree_scene : PackedScene

var num_trees : int = 0
var num_water : int = 0

var co2_sink : float = 0
var water_regen : float = 0


func _ready() -> void:
	EventBus.tick_completed.connect(_on_tick)


func _on_tick(_turn: int) -> void:
	ResourcesManager.co2_delta -= co2_sink
	ResourcesManager.co2 -= co2_sink

	ResourcesManager.water_delta += water_regen
	ResourcesManager.water += water_regen


func spawn_water() -> void:
	num_water += 1
	water_regen = Constants.WATER_PASSIVE_REGEN * clamp(num_water, 0, 10)
	ResourcesManager.water_tiles = num_water
	ResourcesManager.water_regen = water_regen


func spawn_forest(pos: Vector3) -> void:
	var tree := tree_scene.instantiate()
	add_child(tree)
	pos.y = 0
	tree.global_position = pos;
	num_trees += 1
	co2_sink = Constants.TREE_CO2_SINK * clamp(num_trees, 0, 10)
	ResourcesManager.forest_tiles = num_trees
	ResourcesManager.co2_sink = co2_sink