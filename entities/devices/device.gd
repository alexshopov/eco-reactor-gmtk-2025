class_name Device
extends Node

@export
var device_type : Enums.DeviceType

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


func process_turn() -> void:
    if ResourcesManager.energy > energy_input and ResourcesManager.water > water_input \
        and ResourcesManager.o2 > o2_input and ResourcesManager.co2 > co2_input and ResourcesManager.biomass > biomass_input:
        ## delta
        ResourcesManager.energy_delta += (-energy_input + energy_output)
        ResourcesManager.water_delta += (-water_input + water_output)
        ResourcesManager.o2_delta += (-o2_input + o2_output)
        ResourcesManager.co2_delta += (-co2_input + co2_output)
        ResourcesManager.biomass_delta += (-biomass_input + biomass_output)

        ResourcesManager.energy += (-energy_input + energy_output)
        ResourcesManager.water += (-water_input + water_output)
        ResourcesManager.o2 += (-o2_input + o2_output)
        ResourcesManager.co2 += (-co2_input + co2_output)
        ResourcesManager.biomass += (-biomass_input + biomass_output)

func can_build(tile_data: MapTile) -> bool:
    return tile_data.device_type == Enums.DeviceType.Null and tile_data.tile_type == Enums.TileType.Ground
