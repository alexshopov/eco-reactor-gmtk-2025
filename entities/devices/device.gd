class_name Device
extends Node

@export_group("Inputs")
@export
var energy_input: float 
@export
var o2_input : float
@export
var co2_input : float
@export
var water_input : float
@export
var biomass_input : float

@export_group("Outputs")
@export
var energy_output: float 
@export
var o2_output : float
@export
var co2_output : float
@export
var water_output : float
@export
var biomass_output : float


func _ready() -> void:
    EventBus.tick_completed.connect(_on_tick)


func _on_tick(_turn: int) -> void:
    pass

