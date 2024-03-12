extends CharacterBody2D

var last_velocity = Vector2(0,0)
var locked_in = false
var speed = 0
var rand_num = randi_range(0,4)
var dead = false

@export var drops : PackedScene
@export var hp = 3


func _ready():
	#locked_in = false
	$sprite.self_modulate = Color(1,1,1)
	$hurtbox.monitoring = false
	$hurtbox.monitorable = false
	velocity = Vector2(6000,6000)
	$AnimationPlayer.play('spawn')
	$AnimationPlayer.queue('idle')
	

func _process(_delta):
	if hp <= 0 && !dead:
		dead = true
		spawn_life_saver()
		$AnimationPlayer.play('dead')
		global.score += 500

func _physics_process(delta):
	velocity = velocity * speed
	
	if last_velocity.x > 0:
		$sprite.flip_h = true
	if last_velocity.x <= 0:
		$sprite.flip_h = false
	move_and_slide()
	
	if velocity.length() > 100 && !locked_in && !dead && speed == 1:
		last_velocity = velocity
		$AnimationPlayer.play('idle')
	elif velocity.length() <= 100 && !locked_in && !dead && speed == 1:
		locked_in = true
		speed = 0
		$AnimationPlayer.play('attack')
		
func finished_attack():
	speed =1
	locked_in = false

func spawn_life_saver():
	var life_saver_spawner = drops.instantiate()
	life_saver_spawner.global_position = $hurtbox/coll.global_position
	get_tree().current_scene.call_deferred('add_child', life_saver_spawner)

func _on_hitbox_area_entered(area):
	if area.is_in_group('anchor'):
		hp -= 1
		$sprite.self_modulate = Color(100,100,100)
		$hitbox/hit_feedback.start()
		

func _on_hit_feedback_timeout():
	$sprite.self_modulate = Color(1,1,1)

func sprite_hidden():
	$sprite.visible = false


func _on_visible_on_screen_notifier_3d_screen_exited():
	if $sprite.visible == false:
		queue_free()
