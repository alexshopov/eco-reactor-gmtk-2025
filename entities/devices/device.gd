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
    print("Processing %s" % Constants.DEVICES[device_type].name)
    if ResourcesManager.energy > energy_input and ResourcesManager.water > water_input \
        and ResourcesManager.o2 > o2_input and ResourcesManager.co2 > co2_input and ResourcesManager.biomass > biomass_input:
        ResourcesManager.energy -= energy_input
        ResourcesManager.water -= water_input
        ResourcesManager.o2 -= o2_input
        ResourcesManager.co2 -= co2_input
        ResourcesManager.biomass -= biomass_input

        ResourcesManager.energy += energy_output
        ResourcesManager.water += water_output
        ResourcesManager.o2 += o2_output
        ResourcesManager.co2 += co2_output
        ResourcesManager.biomass += biomass_output

