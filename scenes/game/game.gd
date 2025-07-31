extends Node3D


@onready
var game_manager : GameManager = $GameManager
@onready
var resources_manager : ResourcesManager = $ResourcesManager


func _ready() -> void:
	ResourcesManager.energy = Constants.ENERGY_INITIAL_VALUE
	ResourcesManager.o2 = Constants.O2_INITIAL_VALUE
	ResourcesManager.co2 = Constants.CO2_INITIAL_VALUE
	ResourcesManager.biomass = Constants.BIOMASS_INITIAL_VALUE
	ResourcesManager.water = Constants.WATER_INITIAL_VALUE
