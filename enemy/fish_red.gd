extends CharacterBody2D

var last_velocity = Vector2(0,0)
var locked_in = false
var speed = 1

func _ready():
	#locked_in = false
	$hurtbox.monitoring = false
	$hurtbox.monitorable = false
	velocity = Vector2(6000,6000)
	$AnimationPlayer.play('idle')


func _physics_process(delta):
	velocity = velocity * speed
	
	if last_velocity.x > 0:
		$sprite.flip_h = true
	if last_velocity.x <= 0:
		$sprite.flip_h = false
	move_and_slide()
	
	if velocity.length() > 100 && !locked_in:
		last_velocity = velocity
		$AnimationPlayer.play('idle')
	elif velocity.length() <= 100 && !locked_in:
		locked_in = true
		speed = 0
		$AnimationPlayer.play('attack')
		
func finished_attack():
	speed =1
	locked_in = false
