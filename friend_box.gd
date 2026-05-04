extends StaticBody3D

var active: bool = false
var player: Player
var follower: PackedScene = load("res://follower.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("jump"):
		var new_follower: Follower = follower.instantiate()
		new_follower.position.y = 50
		add_child(new_follower)
