extends Node2D


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		SceneManager.change_scene(SceneManager.LEVEL_1, "fade_to_black")
