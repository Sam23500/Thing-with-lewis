extends Camera3D

@export var mouse_sensitivity = 0.005

@onready var sightline: RayCast3D = $RayCast3D
var sight_range: float = 8

var current_focus: Object
var previous_focus: Object

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	sightline.target_position = Vector3(0,0,-sight_range)

func _input(event):
	if event is InputEventMouseMotion:
		get_parent().rotate_y(-event.relative.x * mouse_sensitivity)
		
		rotation.x -= event.relative.y * mouse_sensitivity
		rotation.x = clamp(rotation.x, deg_to_rad(-89), deg_to_rad(89))
	
	
func _physics_process(delta: float) -> void:
	if sightline.is_colliding():
		current_focus = sightline.get_collider()
	else:
		current_focus = null
	if current_focus != previous_focus:
			activate_focus_object(current_focus)
			deactivate_focus_object(previous_focus)
	else:
		current_focus = null
	previous_focus = current_focus

func activate_focus_object(collider: Object):
	if not collider is Node:
		return
	var target: Node = collider
	if not target.is_in_group("Interactables"):
		return
	target.activate()

func deactivate_focus_object(collider: Object):
	if not collider is Node:
		return
	var target: Node = collider
	if not target.is_in_group("Interactables"):
		return
	target.deactivate()
