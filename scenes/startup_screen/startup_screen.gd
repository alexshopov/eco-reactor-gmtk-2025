class_name StartupScreen
extends Panel


func _ready() -> void:
	$OptionsPanel.visible = false
	$Credits.visible = false


func _on_new_game_button_pressed() -> void:
	SceneManager.go_to_main()


func _on_options_button_pressed() -> void:
	$OptionsPanel.visible = true


func _on_credits_button_pressed() -> void:
	$Credits.visible = true
