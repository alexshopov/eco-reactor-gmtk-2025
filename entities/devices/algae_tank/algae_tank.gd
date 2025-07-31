class_name AlgaeTank
extends Device


func _ready() -> void:
    super()


func _on_tick() -> void:
    ResourcesManager.energy -= energy_input

    ResourcesManager.co2 -= co2_input
    ResourcesManager.water -= water_input

    ResourcesManager.o2 += o2_output
    ResourcesManager.biomass += biomass_output
