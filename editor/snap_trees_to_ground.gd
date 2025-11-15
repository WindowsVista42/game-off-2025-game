@tool
extends EditorScript

func _run():
	var scene = get_scene()
	var space_state = scene.get_world_3d().direct_space_state

	for child in scene.find_children("Tree*"):
		var query = PhysicsRayQueryParameters3D.create(child.transform.origin, child.transform.origin + Vector3(0, -1000, 0))
		var result = space_state.intersect_ray(query)
		child.transform = child.transform.rotated_local(Vector3.UP, randf_range(0.0, PI * 2.0))
		var scale = randf_range(0.95, 1.05)
		var scale_vertical = randf_range(0.9, 1.1)
		child.transform = child.transform.scaled_local(Vector3(scale, scale_vertical, scale))
		if result:
			print(result.position)
			child.transform.origin = result.position + Vector3(0, -0.2, 0)
