class_name BaseState
extends Node

var parent : Node

func enter() -> void:
    pass

func exit() -> void:
    pass

func process_input(_event: InputEvent) -> BaseState:
    return null

func process_gui_input(_event: InputEvent) -> BaseState:
    return null