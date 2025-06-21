extends CanvasLayer

#levels to be loaded
const TITLE_SCREEN := ("res://template/TitleScreen.tscn")

const LEVEL_1 := ("res://levels/level_1.tscn")
const LEVEL_2 := ("res://levels/level_2.tscn")

#declare transition animation names to relevent array
var simpleTransitionArray = ["fade_to_black", "swipe_from_left"]
var advancedTransitionArray = ["curtain_close_horizontal", "curtain_close_vertical"]

#script variables
@onready var fade_rect: ColorRect = $FadeRect
@onready var anim: AnimationPlayer = $AnimationPlayer
@export var firstScene: PackedScene
var scene_is_changing = false


func _ready() -> void:
	# First Scene to load in game
	fade_rect.color = Color(0,0,0,255)
	fade_rect.position = Vector2.ZERO
	anim.play("fade_from_black")
	get_tree().call_deferred("change_scene_to_packed", firstScene)
		
		
func _process(_delta: float) -> void:
	pass

##Use this function to change scene, set a transition - "fade_to_black", "swipe_from_left", and duration multiplier (default 1)
##[br]
##res://template/transition.gd
##[br]
func change_scene(scene: String, transition: String = "none", duration: float = 1.0) -> void:
	anim.speed_scale *= duration
	if !scene_is_changing:
		if transition == "none":
			get_tree().call_deferred("change_scene_to_file", scene)
		elif simpleTransitionArray.has(transition):
			run_change_scene(transition, scene)
		elif advancedTransitionArray.has(transition):
			print("Advanced Transition Called!")
		else:
			push_error("Unknown transition " + "( " + transition +  " )" + " called. If no transition is needed, arg String: 'none' is required. Refer to change_scene() hint at list of available transitions")
			breakpoint
	else: 
		return
	anim.speed_scale = 1
	
	
func run_change_scene(anim_name: String, scene) -> void:
		scene_is_changing = true
		anim.play(anim_name)
		await anim.animation_finished
		get_tree().call_deferred("change_scene_to_file", scene)
		anim.play_backwards(anim_name)
		await anim.animation_finished
		scene_is_changing = false
		
func transition_curtain_close():
	pass
	
func fade_only() -> void:
	anim.play("fade_to_black")
	
	
	

	

	


	
