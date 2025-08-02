extends Node

const TICK_DURATION_FAST : int = 3
const TICK_DURATION_NORMAL : int = 6

const ENERGY_INITIAL_VALUE : float = 100
const O2_INITIAL_VALUE : float = 50
const CO2_INITIAL_VALUE : float = 40
const WATER_INITIAL_VALUE : float = 60
const BIOMASS_INITIAL_VALUE : float = 20

const TILE_DATA : Dictionary = {
    Enums.TileType.Ground: "Ground",
    Enums.TileType.Water: "Water",
}

const TREE_CO2_SINK : float = 0.2
const WATER_PASSIVE_REGEN : float = 0.1

const RESOURCES = [
    "Energy", "Water", "O2", "CO2", "Biomass"
]

const DEVICES = {
    Enums.DeviceType.AlgaeTank: {
        "name": "Algae Tank",
        "cost": 12,
        "inputs": [
            { "Energy": 2 },
            { "Water": 1 },
            { "O2": 0 },
            { "CO2": 1 },
            { "Biomass": 0 },
        ],
        "outputs": [
            { "Energy": 0 },
            { "Water": 0 },
            { "O2": 1 },
            { "CO2": 0 },
            { "Biomass": 1 },
        ]
    },
    Enums.DeviceType.CompostReactor: {
        "name": "Compost Reactor",
        "cost": 10,
        "inputs": [
            { "Energy": 1 },
            { "Water": 0 },
            { "O2": 0 },
            { "CO2": 0 },
            { "Biomass": 1 },
        ],
        "outputs": [
            { "Energy": 0 },
            { "Water": 0 },
            { "O2": 0 },
            { "CO2": 1 },
            { "Biomass": 0 },
        ]
    },
    Enums.DeviceType.WaterPurifier: {
        "name": "Water Purifier",
        "cost": 20,
        "inputs": [
            { "Energy": 3 },
            { "Water": 0 },
            { "O2": 0 },
            { "CO2": 0 },
            { "Biomass": 0 },
        ],
        "outputs": [
            { "Energy": 0 },
            { "Water": 2 },
            { "O2": 0 },
            { "CO2": 0 },
            { "Biomass": 0 },
        ]
    },
    Enums.DeviceType.SolarPanel: {
        "name": "Solar Panel",
        "cost": 10,
        "inputs": [
            { "Energy": 0 },
            { "Water": 0 },
            { "O2": 0 },
            { "CO2": 0 },
            { "Biomass": 0 },
        ],
        "outputs": [
            { "Energy": 1 },
            { "Water": 0 },
            { "O2": 0 },
            { "CO2": 0 },
            { "Biomass": 0 },
        ]
    }
}