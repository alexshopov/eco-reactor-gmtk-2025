class_name UI
extends Control


func _ready() -> void:
	$OptionsPanel.visible = false
	%DeviceInfoPanel.visible = false
	%TileInfoPanel.visible = false

	EventBus.tile_highlighted.connect(_on_tile_highlighted)
	# EventBus.device_highlighted.connect(_on_device_highlighted)
	EventBus.device_card_hovered.connect(_on_device_card_hovered)

	EventBus.tick_completed.connect(_on_tick)

	EventBus.energy_updated.connect(_on_energy_updated)
	EventBus.energy_delta_updated.connect(_on_energy_delta_updated)
	
	EventBus.o2_updated.connect(_on_o2_updated)
	EventBus.o2_delta_updated.connect(_on_o2_delta_updated)

	EventBus.co2_updated.connect(_on_co2_updated)
	EventBus.co2_delta_updated.connect(_on_co2_delta_updated)

	EventBus.biomass_updated.connect(_on_biomass_updated)
	EventBus.biomass_delta_updated.connect(_on_biomass_delta_updated)

	EventBus.water_updated.connect(_on_water_updated)
	EventBus.water_delta_updated.connect(_on_water_delta_updated)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_options"):
		$OptionsPanel.visible = true


func _on_device_card_hovered(device_type: Enums.DeviceType) -> void:
	if device_type != Enums.DeviceType.Null:
		set_device_info_panel(device_type)
		%DeviceInfoPanel.visible = true
	else:
		%DeviceInfoPanel.visible = false


func _on_tile_highlighted(_pos: Vector3, tile_data: MapTile) -> void:
	%TileInfoPanel/TileInfoData.text = ""

	if tile_data:
		%TileInfoPanel/TileInfoLabel.text = Constants.TILE_DATA[tile_data.tile_type]
		if tile_data.device_type != Enums.DeviceType.Null:
			%TileInfoPanel/TileInfoData.text = Constants.DEVICES[tile_data.device_type]["name"] + "\nPress X to destroy"
		else:
			match tile_data.tile_type:
				Enums.TileType.Water:
					%TileInfoPanel/TileInfoData.text = Constants.TILE_DESCRIPTIONS[tile_data.tile_type] % [ResourcesManager.water_tiles, ResourcesManager.water_regen]
				Enums.TileType.Forest:
					%TileInfoPanel/TileInfoData.text = Constants.TILE_DESCRIPTIONS[tile_data.tile_type] % [ResourcesManager.forest_tiles, ResourcesManager.co2_sink]
				_:
					%TileInfoPanel/TileInfoData.text = Constants.TILE_DESCRIPTIONS[tile_data.tile_type]

		%TileInfoPanel.visible = true
	else:
		%TileInfoPanel.visible = false


func _on_device_highlighted(device: Device) -> void:
	if device:
		var mouse_pos = get_viewport().get_mouse_position()
		%DeviceInfoPanel.position = Vector2(mouse_pos.x - 200, mouse_pos.y + 10)
		%DeviceInfoPanel.visible = true
		%DeviceInfoPanel/DeviceInfoLabel.text = device.name
	else:
		%DeviceInfoPanel.visible = false


func _on_tick(tick: int) -> void:
	%TurnLabel.text = "Day %d" % tick


func _on_energy_updated(value: float) -> void:
	%EnergyProgressBar.value = _get_value(value)

func _on_energy_delta_updated(value: float) -> void:
	%EnergyDelta.text = "%0.1f" % value


func _on_o2_updated(value: float) -> void:
	%O2ProgressBar.value = _get_value(value)

func _on_o2_delta_updated(value: float) -> void:
	%O2Delta.text = "%0.1f" % value


func _on_co2_updated(value: float) -> void:
	%CO2ProgressBar.value = _get_value(value)

func _on_co2_delta_updated(value: float) -> void:
	%CO2Delta.text = "%0.1f" % value


func _on_biomass_updated(value: float) -> void:
	%BiomassProgressBar.value = _get_value(value)

func _on_biomass_delta_updated(value: float) -> void:
	%BiomassDelta.text = "%0.1f" % value


func _on_water_updated(value: float) -> void:
	%WaterProgressBar.value = _get_value(value)

func _on_water_delta_updated(value: float) -> void:
	%WaterDelta.text = "%0.1f" % value


func _get_value(value: float) -> float:
	return clamp(value, 0, 100)


func set_device_info_panel(device_type: Enums.DeviceType) -> void:
	%DeviceInfoPanel/DeviceInfoLabel.text = Constants.DEVICES[device_type].name
	%DeviceInfoPanel/DeviceCost/DeviceCostLabel.text = "%d" % Constants.DEVICES[device_type].cost

	var inputs : Array = Constants.DEVICES[device_type].inputs 
	var outputs : Array = Constants.DEVICES[device_type].outputs
	var input_label := ""
	var output_label := ""
	for idx in Constants.RESOURCES.size():
		if inputs[idx][Constants.RESOURCES[idx]] != 0:
			input_label += "%d %s\n" % [inputs[idx][Constants.RESOURCES[idx]], Constants.RESOURCES[idx]]
		if outputs[idx][Constants.RESOURCES[idx]] != 0:
			output_label += "%d %s\n" % [outputs[idx][Constants.RESOURCES[idx]], Constants.RESOURCES[idx]]

	%DeviceInfoPanel/InputLabel.text = input_label
	%DeviceInfoPanel/OutputLabel.text = output_label



func _on_options_button_pressed() -> void:
	$OptionsPanel.visible = true

func _on_options_button_mouse_entered() -> void:
	$OptionsButton.scale = Vector2(1.2, 1.2)

func _on_options_button_mouse_exited() -> void:
	$OptionsButton.scale = Vector2.ONE
