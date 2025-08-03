# Eco Reactor

Eco Reactor is a minimalist ecological simulation built for GMTK Game Jam 2025, based on the theme “Loop.”

<img width="1600" height="910" alt="eco-reactor_01" src="https://github.com/user-attachments/assets/360d7d7d-3f3c-44da-a3ad-264d9b370f10" />


## How it Works

Build and stabilize a closed-loop life support system using solar panels, algae tanks, compost reactors, and more. Every device affects the balance of energy, oxygen, carbon dioxide, water, and biomass resources.

Each turn, resources naturally increase or decay. Your job is to close the loop before the system collapses.

https://ecodevguy.itch.io/eco-reactor

## Baseline Behavior

Each turn, natural decay applies:

- Oxygen -1
- Carbon Dioxide +1
- Water -0.2
- Biomass -0.5

Terrain passively contributes:

- Forest tiles: -0.2 CO2 (rounded)
- Water tiles: +0.1 Water

## Controls

Click a device icon on the left toolbar to select it. 

Click an empty ground tile on the grid to place it.

Break down modules by hovering over the module and pressing X