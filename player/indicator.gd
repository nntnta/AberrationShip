extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play('idle')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$sprite.position.x = get_global_mouse_position().x
	$sprite.position.y = get_global_mouse_position().y + 230
