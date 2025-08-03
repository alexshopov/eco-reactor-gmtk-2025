extends Control

func _ready() -> void:
	visible = false


func _on_button_pressed() -> void:
	EventBus.reset_simulation.emit()
	visible = false


func _on_quit_pressed() -> void:
	SceneManager.go_to_startup()
