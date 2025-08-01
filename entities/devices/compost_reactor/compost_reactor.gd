class_name CompostReactor
extends Device


func _ready() -> void:
    super()


func _on_tick(_turn: int) -> void:
    ResourcesManager.energy -= energy_input

    ResourcesManager.water -= water_input
    ResourcesManager.o2 -= o2_input
    ResourcesManager.co2 -= co2_input
    ResourcesManager.biomass -= biomass_input

    ResourcesManager.water += water_output
    ResourcesManager.o2 += o2_output
    ResourcesManager.co2 += co2_output
    ResourcesManager.biomass += biomass_output
