extends Node

@onready var startup_scene = preload("res://scenes/startup_screen/startup_screen.tscn")
@onready var main_scene = preload("res://scenes/main/main.tscn")

func go_to_startup():
	get_tree().change_scene_to_packed(startup_scene)

func go_to_main():
	get_tree().change_scene_to_packed(main_scene)
