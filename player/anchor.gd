extends CharacterBody2D

var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play('drop')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed * delta
	

func cease():
	speed = 0


func _on_hitbox_area_entered(area):
	pass
	#if (area.is_in_group('ship') or area.is_in_group('fish_body')):
		#$AnimationPlayer.play('hit')
		#queue_free()
