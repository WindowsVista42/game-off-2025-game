extends CharacterBody3D

const SPEED = 5.0

@onready
var CAMERA = $Camera3D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	var forward = CAMERA.get_camera_transform().basis.z
	forward.y = 0.0
	
	var right = CAMERA.get_camera_transform().basis.x
	right.y = 0.0
	
	var direction: Vector3 = (forward.normalized() * input_dir.y + right.normalized() * input_dir.x).normalized()
	direction = direction.normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	# print(CAMERA.global_transform)

	move_and_slide()
