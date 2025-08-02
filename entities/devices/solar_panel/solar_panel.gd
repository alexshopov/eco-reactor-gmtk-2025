class_name SolarPanel
extends Device


func process_turn() -> void:
    ResourcesManager.energy_delta += 1
    ResourcesManager.energy += 1