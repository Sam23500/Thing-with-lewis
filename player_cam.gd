extends Camera3D

@export var mouse_sensitivity = 0.005

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		get_parent().rotate_y(-event.relative.x * mouse_sensitivity)
		
		rotation.x -= event.relative.y * mouse_sensitivity
		rotation.x = clamp(rotation.x, deg_to_rad(-89), deg_to_rad(89))
