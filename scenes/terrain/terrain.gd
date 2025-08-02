class_name Terrain
extends Node

var num_trees : int = 6
var num_water : int = 12

func _ready() -> void:
	EventBus.tick_completed.connect(_on_tick)


func _on_tick(_turn: int) -> void:
	ResourcesManager.co2 -= (num_trees * Constants.TREE_CO2_SINK)
	ResourcesManager.water += (num_water * Constants.WATER_PASSIVE_REGEN)

