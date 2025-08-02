class_name Terrain
extends Node

@export
var tree_scene : PackedScene

var num_trees : int = 0
var num_water : int = 0

func _ready() -> void:
	EventBus.tick_completed.connect(_on_tick)
	# EventBus.tile_highlighted(_on_tile_highlighted)


func _on_tick(_turn: int) -> void:
	ResourcesManager.co2_delta -= (num_trees * Constants.TREE_CO2_SINK)
	ResourcesManager.co2 -= (num_trees * Constants.TREE_CO2_SINK)

	ResourcesManager.water_delta += (num_water * Constants.WATER_PASSIVE_REGEN)
	ResourcesManager.water += (num_water * Constants.WATER_PASSIVE_REGEN)


func spawn_water() -> void:
	num_water += 1


func spawn_forest(pos: Vector3) -> void:
	var tree := tree_scene.instantiate()
	add_child(tree)
	pos.y = 0
	tree.global_position = pos;
	num_trees += 1

