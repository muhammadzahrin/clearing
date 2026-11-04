extends CharacterBody3D

const SPEED := 3.0 # slow walk: horror wants you to feel exposed
const MOUSE_SENSITIVITY := 0.003

@onready var camera: Camera3D = $Camera3D


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		# screen_relative, not relative: the 320x240 scaling would otherwise shrink mouse movement.
		rotate_y(-event.screen_relative.x * MOUSE_SENSITIVITY) # body turns left/right
		camera.rotate_x(-event.screen_relative.y * MOUSE_SENSITIVITY) # head looks up/down
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-80), deg_to_rad(80))
	elif event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	elif event is InputEventMouseButton and event.pressed:
		# Browsers only allow mouse capture after a click.
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	var input := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	# transform.basis turns "forward on the keyboard" into "forward where the player faces".
	var direction := transform.basis * Vector3(input.x, 0, input.y)
	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED
	move_and_slide()
