extends Node2D

var pos = Vector2()
var circle_width := 0.0
@onready var polygon_2d: Polygon2D = $Polygon2D
@onready var spawner: Node2D = $Spawner
var rotationSpeed = 2
var screenSize = Vector2()
@export var polygonScale := Vector2(1.0,1.0)
@export var spawnNumber: int = 1


const BLOCK := preload("res://scenes/block.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var degreeChange = 360 / float(spawnNumber)
	polygon_2d.hide()
	polygon_2d.scale = polygonScale
	screenSize = get_viewport_rect().size
	position = screenSize / 2
	pos = self.position
	
	for i in spawnNumber:
		spawn_block()
		spawner.rotation_degrees += degreeChange
	
	#spawn_block()
	#spawner.rotation_degrees += 45
	#spawn_block()
	#spawner.rotation_degrees += 45
	#spawn_block()
	#spawner.rotation_degrees += 45
	#spawn_block()
	#spawner.rotation_degrees += 45
	#spawn_block()
	#spawner.rotation_degrees += 45
	#spawn_block()
	#spawner.rotation_degrees += 45
	#spawn_block()
	#spawner.rotation_degrees += 45
	#spawn_block()
	#spawner.rotation_degrees += 45

func _process(delta: float) -> void:
	if Input.is_action_pressed("move_circle_left"):
		rotation -= rotationSpeed * delta
	elif Input.is_action_pressed("move_circle_right"):
		rotation += rotationSpeed * delta
	
func spawn_block() -> void:
	var newBlock = BLOCK.instantiate()
	newBlock.position.x = 200 * polygonScale.x
	spawner.add_child(newBlock)
	newBlock.reparent(self)
	newBlock.look_at(pos)


	
	

	
	
