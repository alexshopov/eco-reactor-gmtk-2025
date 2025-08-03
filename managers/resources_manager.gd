extends Node

var energy : float :
	set(value):
		energy = value
		EventBus.energy_updated.emit(energy)
var energy_delta : float :
	set(value):
		energy_delta = value
		EventBus.energy_delta_updated.emit(energy_delta)

var o2: float :
	set(value):
		o2 = value
		EventBus.o2_updated.emit(o2)

		if o2 <= 0:
			EventBus.system_collapsed.emit()
			return

		if o2 < Constants.O2_STABLE_MIN or o2 > Constants.O2_STABLE_MAX:
			EventBus.resource_entered_non_ideal_range.emit(Enums.GameResource.O2)
		else:
			EventBus.resource_entered_ideal_range.emit(Enums.GameResource.O2)

var o2_delta: float :
	set(value):
		o2_delta = value
		EventBus.o2_delta_updated.emit(o2_delta)

var co2 : float :
	set(value):
		co2 = value
		EventBus.co2_updated.emit(co2)

		if co2 <= 0 or co2 >= 100:
			EventBus.system_collapsed.emit()
			return

		if co2 < Constants.CO2_STABLE_MIN or co2 > Constants.CO2_STABLE_MAX:
			EventBus.resource_entered_non_ideal_range.emit(Enums.GameResource.CO2)
		else:
			EventBus.resource_entered_ideal_range.emit(Enums.GameResource.CO2)

var co2_delta: float :
	set(value):
		co2_delta = value
		EventBus.co2_delta_updated.emit(co2_delta)

var biomass : float :
	set(value):
		biomass = value
		EventBus.biomass_updated.emit(biomass)

		if biomass <= 0:
			EventBus.system_collapsed.emit()
			return


		if biomass < Constants.BIOMASS_STABLE_MIN or biomass > Constants.BIOMASS_STABLE_MAX:
			EventBus.resource_entered_non_ideal_range.emit(Enums.GameResource.Biomass)
		else:
			EventBus.resource_entered_ideal_range.emit(Enums.GameResource.Biomass)

var biomass_delta: float :
	set(value):
		biomass_delta = value
		EventBus.biomass_delta_updated.emit(biomass_delta)

var water : float :
	set(value):
		water = value
		EventBus.water_updated.emit(water)

		if water <= 0:
			EventBus.system_collapsed.emit()
			return

		if water < Constants.WATER_STABLE_MIN or water > Constants.WATER_STABLE_MAX:
			EventBus.resource_entered_non_ideal_range.emit(Enums.GameResource.Water)
		else:
			EventBus.resource_entered_ideal_range.emit(Enums.GameResource.Water)

var water_delta: float :
	set(value):
		water_delta = value
		EventBus.water_delta_updated.emit(water_delta)

var forest_tiles : int = 0
var co2_sink : float
var water_tiles : int = 0
var water_regen : float

func _ready() -> void:
	_on_reset_simulation()
	EventBus.reset_simulation.connect(_on_reset_simulation)


func _on_reset_simulation() -> void:
	energy = Constants.ENERGY_INITIAL_VALUE
	o2 = Constants.O2_INITIAL_VALUE
	co2 = Constants.CO2_INITIAL_VALUE
	water = Constants.WATER_INITIAL_VALUE
	biomass = Constants.BIOMASS_INITIAL_VALUE


func next_turn() -> void:
	# standard decay
	energy_delta = 0
	o2_delta = -2
	co2_delta = 2
	water_delta = -0.2 
	biomass_delta = -1

	o2 -= 2
	co2 += 2
	water -= 0.2
	biomass -= 1
