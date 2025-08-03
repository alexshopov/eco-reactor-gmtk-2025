extends Node

const TICK_DURATION_FAST : int = 3
const TICK_DURATION_NORMAL : int = 5

const ENERGY_INITIAL_VALUE : float = 100

const O2_STABLE_MIN : float = 50
const O2_STABLE_MAX : float = 100
const O2_INITIAL_VALUE : float = 75

const CO2_INITIAL_VALUE : float = 40
const CO2_STABLE_MIN : float = 20
const CO2_STABLE_MAX : float = 60

const WATER_INITIAL_VALUE : float = 50
const WATER_STABLE_MIN : float = 30
const WATER_STABLE_MAX : float = 70

const BIOMASS_INITIAL_VALUE : float = 25
const BIOMASS_STABLE_MIN : float = 10
const BIOMASS_STABLE_MAX : float = 40

const TREE_CO2_SINK : float = 0.2
const WATER_PASSIVE_REGEN : float = 0.1

const TILE_DATA : Dictionary = {
	Enums.TileType.Ground: "Ground",
	Enums.TileType.Water: "Water",
	Enums.TileType.Forest: "Forest",
}

const TILE_DESCRIPTIONS : Dictionary = {
	Enums.TileType.Ground: "[center]Dirt[/center]", 
	Enums.TileType.Water: "%d water tiles produce [color=#465ffa][b]%0.1f[/b][/color] units of water per day",
	Enums.TileType.Forest: "%d forest tile absorb [color=#FF0000][b]%0.1f[/b][/color] units of CO2 per day"
}

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
	},
		Enums.DeviceType.BiomassGenerator: {
		"name": "Biomass Generator",
		"cost": 15,
		"inputs": [
			{ "Energy": 0 },
			{ "Water": 0 },
			{ "O2": 0 },
			{ "CO2": 0 },
			{ "Biomass": 1 },
		],
		"outputs": [
			{ "Energy": 2 },
			{ "Water": 0 },
			{ "O2": 0 },
			{ "CO2": 0 },
			{ "Biomass": 0 },
		]
	},
	Enums.DeviceType.NutrientVat: {
		"name": "Nutrient Vat",
		"cost": 10,
		"inputs": [
			{ "Energy": 1 },
			{ "Water": 1 },
			{ "O2": 0 },
			{ "CO2": 0 },
			{ "Biomass": 0 },
		],
		"outputs": [
			{ "Energy": 0 },
			{ "Water": 0 },
			{ "O2": 0 },
			{ "CO2": 0 },
			{ "Biomass": 1 },
		]
	},
	Enums.DeviceType.FungalDecomposer: {
		"name": "Fungal Decomposer",
		"cost": 12,
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
	Enums.DeviceType.AeroponicTower: {
		"name": "Aeroponic Tower",
		"cost": 18,
		"inputs": [
			{ "Energy": 2 },
			{ "Water": 1 },
			{ "O2": 0 },
			{ "CO2": 0 },
			{ "Biomass": 0 },
		],
		"outputs": [
			{ "Energy": 0 },
			{ "Water": 0 },
			{ "O2": 2 },
			{ "CO2": 0 },
			{ "Biomass": 0 },
		]
	}
}