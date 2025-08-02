extends Node

var energy : float :
	set(value):
		energy = value
		EventBus.energy_updated.emit(energy)

var o2: float :
	set(value):
		o2 = value
		EventBus.o2_updated.emit(o2)

var co2 : float :
	set(value):
		co2 = value
		EventBus.co2_updated.emit(co2)

var biomass : float :
	set(value):
		biomass = value
		EventBus.biomass_updated.emit(biomass)

var water : float :
	set(value):
		water = value
		EventBus.water_updated.emit(water)


func next_turn() -> void:
	# standard decay
	o2 -= 1
	co2 += 1
	water -= 0.2
	biomass -= 0.5

	print(o2)
	print(co2)
	print(water)
	print(biomass)