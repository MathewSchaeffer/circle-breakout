extends Node2D

@export var view_time: int = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	exit_splash()
	 # Replace with function body.
func exit_splash() -> void:
	await get_tree().create_timer(view_time).timeout
	SceneManager.change_scene(SceneManager.TITLE_SCREEN, "fade_to_black", 0.25)
