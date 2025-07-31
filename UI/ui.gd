class_name UI
extends Control


func _ready() -> void:
	EventBus.energy_updated.connect(_on_energy_updated)
	EventBus.o2_updated.connect(_on_o2_updated)
	EventBus.co2_updated.connect(_on_co2_updated)
	EventBus.biomass_updated.connect(_on_biomass_updated)
	EventBus.water_updated.connect(_on_water_updated)


func _on_energy_updated(value: float) -> void:
	%EnergyProgressBar.value = value


func _on_o2_updated(value: float) -> void:
	%O2ProgressBar.value = value


func _on_co2_updated(value: float) -> void:
	%CO2ProgressBar.value = value


func _on_biomass_updated(value: float) -> void:
	%BiomassProgressBar.value = value


func _on_water_updated(value: float) -> void:
	%WaterProgressBar.value = value
