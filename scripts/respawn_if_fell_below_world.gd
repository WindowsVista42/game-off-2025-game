extends Node3D

@onready
var PLAYER = get_node("../../Player")

@onready
var SPAWN_LOCATION = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if PLAYER.transform.origin.y < -500.0:
		PLAYER.transform.origin = SPAWN_LOCATION.transform.origin
