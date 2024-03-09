extends CharacterBody2D

var hp = 5

@export var SPEED = 8000

func _ready():
	$AnimationPlayer.play('idle')

func _physics_process(delta):
	# Add the gravity.
	$Camera2D/TextureProgressBar.value = hp
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


func _on_hitbox_area_entered(area):
	if area.is_in_group('fish') && $sprite.self_modulate == Color(1,1,1):
		$sprite.self_modulate = Color(2.5,0,0)
		$sprite.z_index += 3
		$hitbox/invulnerable.start()
		hp -= 1


func _on_invulnerable_timeout():
	$sprite.z_index = 3
	$sprite.self_modulate = Color(1,1,1)
