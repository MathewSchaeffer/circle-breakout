extends Node2D

const SETTINGS_MENU = preload("res://template/settings_menu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.





func _on_start_pressed() -> void:
	if Global.settingsMenuOpen == true:
		return
	else:
		SceneManager.change_scene(SceneManager.LEVEL_1, "fade_to_black") # Replace with function body.


func _on_settings_pressed() -> void:
	if Global.settingsMenuOpen == true:
		return
	else:
		var createSettings =  SETTINGS_MENU.instantiate()
		add_child(createSettings)


func _on_exit_pressed() -> void:
	if Global.settingsMenuOpen == true:
		return
	else:
		SceneManager.fade_only()
		await get_tree().create_timer(1.5).timeout
		get_tree().quit()
