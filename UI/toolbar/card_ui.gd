class_name CardUI
extends PanelContainer

@export
var device_type : Enums.DeviceType


func _input(event: InputEvent) -> void:
    if event.is_action_pressed("right_click"):
        EventBus.device_card_cancelled.emit()


func _gui_input(event: InputEvent) -> void:
    if event.is_action_pressed("left_click"):
        EventBus.device_card_clicked.emit(device_type)


func _on_mouse_entered() -> void:
    pass


func _on_mouse_exited() -> void:
    pass
