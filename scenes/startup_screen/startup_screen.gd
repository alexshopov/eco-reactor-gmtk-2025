class_name StartupScreen
extends Panel

@export
var main_scene : PackedScene


func _ready() -> void:
	$OptionsPanel.visible = false


func _on_new_game_button_pressed() -> void:
	get_tree().change_scene_to_packed(main_scene)


func _on_options_button_pressed() -> void:
	$OptionsPanel.visible = true


func _on_credits_button_pressed() -> void:
	pass # Replace with function body.

