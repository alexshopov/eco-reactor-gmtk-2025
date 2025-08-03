extends Control


func _ready() -> void:
    visible = false

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("toggle_options"):
        if visible == true:
            visible = false
            get_viewport().set_input_as_handled()


func _on_close_btn_pressed() -> void:
    visible = false
    EventBus.options_panel_closed.emit()