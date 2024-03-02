extends CharacterBody2D


const SPEED = 14000

func _ready():
	$AnimationPlayer.play('idle')

func _physics_process(delta):
	# Add the gravity.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("a", "d", "w", "s")
	if direction:
		velocity.x = direction.x * SPEED * delta
		velocity.y = direction.y * SPEED * delta
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
	
	if velocity.x > 0:
		$sprite.flip_h = true
	if velocity.x < 0:
		$sprite.flip_h = false
