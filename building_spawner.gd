extends StaticBody3D

var active: bool = false

func activate():
	active = true

func deactivate():
	active = false

func _ready():
	pass

func _process(delta: float) -> void:
	# Spawn an object after 2 seconds
	if Input.is_action_just_pressed("interact") and active:
		print("E pressed")
		spawn_object()

func spawn_object():
	# 1. Create a new Sprite2D node
	var sprite = MeshInstance3D.new()
	# 2. Set its texture
	var texture = PrismMesh.new()
	sprite.mesh = texture
	# 3. Set position
	sprite.position = Vector3(randi_range(-50,50), -1, randi_range(-50,50))
	# 4. Add it to the current scene
	add_child(sprite)
	print("Spawn attempted")
