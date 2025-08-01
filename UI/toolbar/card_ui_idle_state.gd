class_name CardUIIdleState
extends BaseState


func enter() -> void:
    if not parent.is_node_ready():
        await parent.ready
