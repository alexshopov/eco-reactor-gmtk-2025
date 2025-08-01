extends Node

signal active_tile_changed(tile_pos: Vector3)
signal device_highlighted(device: Device)

signal tick_completed(turn: int)

signal energy_updated(value: float)
signal o2_updated(value: float)
signal co2_updated(value: float)
signal water_updated(value: float)
signal biomass_updated(value: float)