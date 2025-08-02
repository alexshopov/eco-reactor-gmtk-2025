class_name CardUI
extends PanelContainer

@export
var device_type : Enums.DeviceType
@export
var icon : CompressedTexture2D


func _ready() -> void:
    $Icon.texture = icon


func _input(event: InputEvent) -> void:
    if event.is_action_pressed("right_click"):
        EventBus.device_card_cancelled.emit()


func _gui_input(event: InputEvent) -> void:
    if event.is_action_pressed("left_click"):
        EventBus.device_card_clicked.emit(device_type)


func _on_mouse_entered() -> void:
    EventBus.device_card_hovered.emit(device_type)


func _on_mouse_exited() -> void:
    EventBus.device_card_hovered.emit(Enums.DeviceType.Null)
