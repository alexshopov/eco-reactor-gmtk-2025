class_name GameManager
extends Node

@export
var tick_length : float = Constants.TICK_DURATION_FAST

var turn_counter : int = 0
var tick_timer : float = 0.0


func _ready() -> void:
    EventBus.reset_simulation.connect(_on_reset_simulation)


func _process(delta: float) -> void:
    _update_tick_(delta)


func _on_reset_simulation() -> void:
    turn_counter = 0
    tick_timer = 0.0


func _update_tick_(delta: float) -> void:
    if tick_timer >= tick_length:
        tick_timer = 0
        turn_counter += 1
        ResourcesManager.next_turn()
        EventBus.tick_completed.emit(turn_counter)

    else:
        tick_timer += delta