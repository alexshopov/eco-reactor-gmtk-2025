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
var o2_delta: float :
	set(value):
		o2_delta = value
		EventBus.o2_delta_updated.emit(o2_delta)

var co2 : float :
	set(value):
		co2 = value
		EventBus.co2_updated.emit(co2)
var co2_delta: float :
	set(value):
		co2_delta = value
		EventBus.co2_delta_updated.emit(co2_delta)

var biomass : float :
	set(value):
		biomass = value
		EventBus.biomass_updated.emit(biomass)
var biomass_delta: float :
	set(value):
		biomass_delta = value
		EventBus.biomass_delta_updated.emit(biomass_delta)

var water : float :
	set(value):
		water = value
		EventBus.water_updated.emit(water)
var water_delta: float :
	set(value):
		water_delta = value
		EventBus.water_delta_updated.emit(water_delta)


func next_turn() -> void:
	# standard decay
	energy_delta = 0
	o2_delta = -1
	co2_delta = 1
	water_delta = -0.2 
	biomass_delta = -0.5

	o2 -= 1
	co2 += 1
	water -= 0.2
	biomass -= 0.5
