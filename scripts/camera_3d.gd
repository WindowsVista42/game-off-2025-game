extends Camera3D

const MOUSE_SENS = 0.002



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		self.rotation.x += -event.relative.y * MOUSE_SENS
		self.rotation.y += -event.relative.x * MOUSE_SENS
		self.rotation.x = clampf(self.rotation.x, -deg_to_rad(80), deg_to_rad(80))
		self.rotation.y = fmod(self.rotation.y, deg_to_rad(360.0))
	
	if event is InputEventMouseButton and Input.mouse_mode != Input.MOUSE_MODE_CAPTURED:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	if Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
