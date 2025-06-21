extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
#func _process(_delta: float) -> void:
	#if Input.is_action_just_pressed("ui_accept"):
		#SceneManager.change_scene(SceneManager.LEVEL_2, "swipe_from_left", 2)
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		SceneManager.change_scene(SceneManager.LEVEL_2, "swipe_from_left", 1)
	
