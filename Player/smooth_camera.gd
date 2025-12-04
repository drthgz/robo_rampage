extends Camera3D

# Dampens camera motion so it trails the player smoothly.
@export var speed := 44.0

func _physics_process(delta: float) -> void:
	# Convert delta to a 0..1 blend factor for frame-rate independent smoothing.
	var weight = clamp(delta * speed, 0.0, 1.0)
	
	global_transform = global_transform.interpolate_with(
		get_parent().global_transform, weight
	)
	# Hard-sync position to the parent to avoid drift when rotating separately.
	global_position = get_parent().global_position
