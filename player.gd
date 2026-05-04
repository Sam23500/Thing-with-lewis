class_name Player
extends CharacterBody3D

var target_velocity: Vector3 = Vector3.ZERO

const SPEED: float = 5.0
const SPRINT_SPEED: float = 8.0
const JUMP_VELOCITY: float = 4.5

var max_stamina: float = 2
var stamina: float = 2
var exhausted: bool = false

var max_speed: float = 5.0
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	if Input.is_action_pressed("sprint") and not exhausted:
		max_speed = SPRINT_SPEED
		stamina -= delta
		if stamina < 0:
			stamina = 0
			exhausted = true
	else:
		max_speed = SPEED
		stamina += delta
		if stamina > max_stamina * 0.5 and not Input.is_action_pressed("sprint"):
			exhausted = false
		if stamina > max_stamina:
			stamina = max_stamina
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * max_speed
		velocity.z = direction.z * max_speed
	else:
		velocity.x = move_toward(velocity.x, 0, max_speed)
		velocity.z = move_toward(velocity.z, 0, max_speed)
	
	move_and_slide()
