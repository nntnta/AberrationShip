extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play('idle')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_grab_box_area_entered(area):
	if area.is_in_group('ship'):
		global.cd -= 0.1
		$AnimationPlayer.play('taken')

func destroy():
	get_parent().find_child('fish_red').queue_free()
