extends Node

signal active_tile_changed(tile_pos: Vector3)
signal tile_highlighted(pos: Vector3, tile_data: MapTile)

signal device_card_hovered(device_type: Enums.DeviceType)
signal device_card_clicked(device_type: Enums.DeviceType)
signal device_card_cancelled
signal device_placed(pos: Vector3, tile_data: MapTile)
signal device_destroyed(pos: Vector3)
signal device_highlighted(device: Device)

signal tick_completed(turn: int)

signal energy_updated(value: float)
signal energy_delta_updated(value: float)

signal o2_updated(value: float)
signal o2_delta_updated(value: float)

signal co2_updated(value: float)
signal co2_delta_updated(value: float)

signal water_updated(value: float)
signal water_delta_updated(value: float)

signal biomass_updated(value: float)
signal biomass_delta_updated(value: float)

signal options_panel_opened
signal options_panel_closed
signal master_volume_changed(value: float)

signal resource_entered_non_ideal_range(game_resource: Enums.GameResource)
signal resource_entered_ideal_range(game_resource: Enums.GameResource)

signal system_collapsed
signal reset_simulation