extends StaticBody3D

var active: bool = false

func activate():
	active = true

func deactivate():
	active = false

func _ready():
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and active:
		spawn_object()

func spawn_object():
	var building = preload("res://building.tscn").instantiate()
	building.position = Vector3(randi_range(-50,50), -1, randi_range(-50,50))
	add_child(building)
