extends CharacterBody2D


const SPEED = 490.0
const JUMP_VELOCITY = -990.0
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var jump_sound: AudioStreamPlayer2D = $Jump_sound





func jump():
	velocity.y = JUMP_VELOCITY
	jump_sound.play()

	

func jump_side(x):
	velocity.y = JUMP_VELOCITY
	velocity.x = JUMP_VELOCITY
	


func _physics_process(delta: float) -> void:
	#Animation
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite_2d.animation = "jumping"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sound.play()
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 12)

	move_and_slide()
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
