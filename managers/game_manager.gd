class_name GameManager
extends Node

@export
var tick_length : float = Constants.TICK_DURATION_FAST

var tick_counter : float = 0.0


func _process(delta: float) -> void:
    _update_tick_(delta)


func _update_tick_(delta: float) -> void:
    if tick_counter >= tick_length:
        tick_counter = 0
        EventBus.tick_completed.emit()
    else:
        tick_counter += delta