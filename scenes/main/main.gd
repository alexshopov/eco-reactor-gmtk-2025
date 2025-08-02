extends Node

func _ready() -> void:
	$AudioStreamPlayer.volume_linear = GameOptions.master_volume
	$AudioStreamPlayer.play()

	EventBus.master_volume_changed.connect(_on_master_volume_changed)


func _on_master_volume_changed(value: float) -> void:
	$AudioStreamPlayer.volume_linear = value
