extends ProgressBar

var bounce: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	value = 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if value < 1:
		bounce = true
	if value > 99:
		bounce = false
	
	if bounce:
		value += 1
	else:
		value -= 1
