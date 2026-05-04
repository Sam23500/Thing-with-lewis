class_name Follower
extends CharacterBody3D

var target_velocity = Vector3.ZERO
var player: Player
var follow_dist: float = 3

const SPEED = 4

# Get gravity from project settings to be synced with RigidBody nodes
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	player = get_tree().get_first_node_in_group("Player")

func _physics_process(delta):
	# Add gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	var distance_squared = global_position.distance_squared_to(player.position)
	var direction = global_position.direction_to(player.position)
	if distance_squared < (follow_dist + SPEED*delta)**2:
		direction = 0
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()
