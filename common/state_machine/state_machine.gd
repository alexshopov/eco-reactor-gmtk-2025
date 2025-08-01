class_name StateMachine
extends Node

@export
var starting_state : BaseState

var _state : BaseState

func init(parent: Node) -> void:
    for child in get_children():
        if child is BaseState:
            child.parent = parent

    set_state(starting_state)


func set_state(new_state: BaseState) -> void:
    if _state:
        _state.exit()

    _state = new_state
    _state.enter()