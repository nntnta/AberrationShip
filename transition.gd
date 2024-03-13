extends Node2D

@export var menu: PackedScene
@export var retry: PackedScene

var already_dead = false

func _process(_delta):
	if global.hp <= 0 && !already_dead:
		already_dead = true
		dead()


func retry_pressed():
	$transition/ColorRect.visible = true
	$transition.play("fade_out")
	await get_tree().create_timer(0.5, false).timeout
	get_tree().change_scene_to_packed(menu)
	$transition.play("fade_in")
	
func dead():
	$transition/ColorRect.visible = true
	$transition.play("fade_out")
	await get_tree().create_timer(0.5, false).timeout
	get_tree().change_scene_to_packed(retry)
	$transition.play("fade_in")

