extends Node

enum GameResource {
    O2,
    CO2,
    Water,
    Biomass
}

enum TileType {
    Ground = 0,
    Water,
    Forest
}

enum DeviceType {
    Null = -1,
    AlgaeTank,
    CompostReactor,
    WaterPurifier,
    SolarPanel,
    BiomassGenerator,
    NutrientVat,
    FungalDecomposer,
    AeroponicTower
}
