class_name UI
extends Control


func _ready() -> void:
	%DeviceInfoPanel.visible = false

	EventBus.device_highlighted.connect(_on_device_highlighted)

	EventBus.energy_updated.connect(_on_energy_updated)
	EventBus.o2_updated.connect(_on_o2_updated)
	EventBus.co2_updated.connect(_on_co2_updated)
	EventBus.biomass_updated.connect(_on_biomass_updated)
	EventBus.water_updated.connect(_on_water_updated)



func _on_device_highlighted(device: Device) -> void:
	if device:
		var mouse_pos = get_viewport().get_mouse_position()
		%DeviceInfoPanel.position = Vector2(mouse_pos.x - 200, mouse_pos.y + 10)
		%DeviceInfoPanel.visible = true
		%DeviceInfoPanel/DeviceInfoLabel.text = device.name
	else:
		%DeviceInfoPanel.visible = false


func _on_energy_updated(value: float) -> void:
	%EnergyProgressBar.value = _get_value(value)


func _on_o2_updated(value: float) -> void:
	%O2ProgressBar.value = _get_value(value)


func _on_co2_updated(value: float) -> void:
	%CO2ProgressBar.value = _get_value(value)


func _on_biomass_updated(value: float) -> void:
	%BiomassProgressBar.value = _get_value(value)


func _on_water_updated(value: float) -> void:
	%WaterProgressBar.value = _get_value(value)


func _get_value(value: float) -> float:
	return clamp(value, 0, 100)
